Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328CA3237
	for <linux-sunxi@lists.linux.dev>; Wed,  4 May 2022 19:33:46 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id j6so4770180ejc.13
        for <linux-sunxi@lists.linux.dev>; Wed, 04 May 2022 12:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :cc:to;
        bh=4ht9G50SlYlr7BPTCuy+KjNotHQlLEXbSKghIYlF3TI=;
        b=EfORBn1IU5YLU6vM2lbHgc9xrAtSW0JJzEpjkXnN3Y4B1jVYnMZsrilE74yba/6U5T
         foNTCBSV4aOokszBa7PibzEXLnjScFYevmiylFPTcrK0G0mdFFO85zLbAPPZbWS/40s3
         IKk9oVafeGEn49zoSyxzMp0T3pl5iHAURlv4N60bM+BqKwE0nli6Bku9TeYyXQZ60/ni
         xtyCzYLlLnX9yfEsRrpEXxz6LCVjRkOJF2Gi5Oay+CcjWoqT0vPH8lGTpx1ILjKvE5Vm
         LGv7vUhuVrzoZGeLKsDX5wHNDwhDw+JCPRklh6KfKRtvy5Ys1qDPMU8W09vFcls99SqW
         b4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:cc:to;
        bh=4ht9G50SlYlr7BPTCuy+KjNotHQlLEXbSKghIYlF3TI=;
        b=4FtlkeneEX8YaCswKCeOgqgQEMamU13QPldhnDZ1mZJs5j9z2PeodwPcgrTxNxE/E6
         UuQIpQIGwzdA5ev0M3w9ALZTOvlWZRPFadKrZ7vj4m+v1gVV03PvNKuzj40JPsH0PUiB
         1icdcO06ngTHWSVGcXfR4tBBknebv8T1K7Z9VvjMiniUQnnRpNi9BhSsa2KNGEDXWpeC
         dgBu+zMI4Jb5W6A3VGy6tqHNokU53w4lgoTZ9Q7CSIa2UxtnNT942HiFIEyT7yYVWIF3
         L8ywJrQdpjXbnmUm17+/za1INKn8En9LStXDpCv6Nxp0hzB7fgVbjoOk0zz114NHoBcP
         dyLA==
X-Gm-Message-State: AOAM532BAYtHeOcesHSCDvjBQJAzacZ4j+9gYBB9a0Vta7tn4sGxNsvF
	9O5OUzGpldyHx86dAceMuZc=
X-Google-Smtp-Source: ABdhPJwHcrtSQDlr+mZ7DmEAqZ68d81+yOhTo8ytpNTbKbcNHduv7VeyTXo7SzIxQjlFKNlEhAXEAQ==
X-Received: by 2002:a17:906:a05a:b0:6ef:a44d:2f46 with SMTP id bg26-20020a170906a05a00b006efa44d2f46mr21506417ejb.192.1651692824481;
        Wed, 04 May 2022 12:33:44 -0700 (PDT)
Received: from smtpclient.apple ([2a02:c7f:d28e:8500:75f8:3e84:fd90:ebc])
        by smtp.gmail.com with ESMTPSA id jl6-20020a17090775c600b006f3ef214e64sm5962053ejc.202.2022.05.04.12.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 12:33:43 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From: Jamie Cuthbert <jamiecuthbert0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2] hwmon: (sun4i-lradc) Add driver for LRADC found on Allwinner A13/A20 SoC
Date: Wed, 4 May 2022 20:33:43 +0100
Message-Id: <FDBABC84-481C-4B0C-8475-131CA491DB4C@gmail.com>
Cc: jdelvare@suse.com, jernej.skrabec@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux@roeck-us.net, samuel@sholland.org, wens@csie.org
To: rz@fabmicro.ru
X-Mailer: iPhone Mail (19E258)



Sent from my iPhone
