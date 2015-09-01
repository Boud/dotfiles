<?php

class ClassProvider extends Tools implements ProviderInterface
{
    /**
     * Execute the command
     * @param  array  $args Arguments gived to the command
     * @return array Response
     */
    public function execute($args = array())
    {
        $class = $args[0];

        try {
            $reflection = new ReflectionClass($class);
        } catch (Exception $e) {
            return array('error' => $e->getMessage());
        }

        $ctor = $reflection->getConstructor();

        $args = array();
        if (!is_null($ctor)) {
            $args = $this->getMethodArguments($ctor);
        }

        return array(
            'methods' => array(
                'constructor' => array(
                    'has'  => !is_null($ctor),
                'args' => $args
                )
            )
        );
    }
}

?>
