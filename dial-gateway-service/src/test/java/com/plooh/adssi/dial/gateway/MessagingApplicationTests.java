package com.plooh.adssi.dial.gateway;

import com.plooh.adssi.dial.gateway.config.MapStoreConfig;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;

@SpringBootTest(classes = MessagingApplication.class)
@ContextConfiguration(classes = {MapStoreConfig.class})
public class MessagingApplicationTests {
}
