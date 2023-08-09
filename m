Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4E82452C
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Aug 2023 22:44:32 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3492905f546so1301415ab.0
        for <linux-sunxi@lists.linux.dev>; Wed, 09 Aug 2023 15:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691621071; x=1692225871;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b9z60Tmfid0bY6/H18uiD5bPcjWAixU09H2TTPOlMaY=;
        b=g6uKI46h6elK5WyJgxgxTpKBCxOxdgbZ1S2032E4k9J5FOkLOCzoStuWK2HZzFjKBI
         nN6CV5o/t4W6u9+FKjJZsNp8O9h5RtPV9SrouP+qPcyKe0x01xVvb044+yHvHE8S3Gvr
         s/qXIv7VjORnODB13cWRDomtIwjK8HMf4KkyR7+9e6zQz6kOguCZuNC6ypdaTbP7O5Gi
         nbrZgKyQe6UYQbw/f4cdCZLEGTtE1MOUjnO8AGnTrHfzX7ozQY+0z2XHB6Gv5IWuROMG
         J8ftKp6gM6A0HUu+ybSwE070a0c833jdtZZ+3wsRq2l1bV/hsIxFs8wiOOV2pFSrsNhg
         eTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691621071; x=1692225871;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b9z60Tmfid0bY6/H18uiD5bPcjWAixU09H2TTPOlMaY=;
        b=WCRjIAaZUSqE9M0cpHF4EFqQc6eGPZN+yqKRySzkHQ9lae1j1Ss5MMjg900U0C+8xT
         EPTMEzk3Hv1zkI8ecKGt0HygfwLXPgCehnM8BdYYfGcwv3eabUgUVRp/CqRYTUpm32Wx
         rRvt/zfcsTj9l02wdyY4rBsvYJUlg1O4jnJ3cGNlzL7JjHckgWtIDkVZto7cDWTAD83n
         XkymlwpBcO3qNgefde/PEGRYQumtE9REBplnUiY5O2dEdKONFRGH8iJ0G6rxUqqL2Tl9
         FcoQt9DYARl9+XTp7/yfIBPxcmQpKHNtqkQ/hHyPyOskLSvsepPiq5Q0Q1Y/URR4qgJk
         /wBA==
X-Gm-Message-State: AOJu0Yw2ZpoHE17m4lcSUyyQJX+gbhRQgLQSJdfViZIu80feHY8Wis0t
	j4B8VhGgVZpKYFe2GyizzBaTwMzIElgrQQ==
X-Google-Smtp-Source: AGHT+IGlxI1Sm3HtvOgNa4Tsa/6v1PrdggJkTPk2ilXGqFsjSBEvkHHoewfOgjYVMG/5yjh3bIIREw==
X-Received: by 2002:a05:6e02:1bcc:b0:349:2bab:9e47 with SMTP id x12-20020a056e021bcc00b003492bab9e47mr682482ilv.12.1691621071312;
        Wed, 09 Aug 2023 15:44:31 -0700 (PDT)
Received: from ?IPV6:2001:470:42c4:101:6e71:1f10:2120:d11d? ([2001:470:42c4:101:6e71:1f10:2120:d11d])
        by smtp.gmail.com with ESMTPSA id gj20-20020a0566386a1400b0042b34d4d07fsm8385jab.156.2023.08.09.15.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 15:44:30 -0700 (PDT)
Message-ID: <08e119b6-0f05-b0f2-bb7f-0f0b251ec917@gmail.com>
Date: Wed, 9 Aug 2023 16:44:30 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 09/20] pinctrl: sunxi: add Allwinner D1 pinctrl
 description
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>, u-boot@lists.denx.de
Cc: Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
 Maxim Kiselev <bigunclemax@gmail.com>, linux-sunxi@lists.linux.dev
References: <20230721134606.4505-1-andre.przywara@arm.com>
 <20230721134606.4505-10-andre.przywara@arm.com>
From: Sam Edwards <cfsworks@gmail.com>
In-Reply-To: <20230721134606.4505-10-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/21/23 07:45, Andre Przywara wrote:
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> index fc80fe50b14..c6115112688 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -748,6 +748,28 @@ static const struct sunxi_pinctrl_desc __maybe_unused sun50i_h616_r_pinctrl_desc
>   	.num_banks	= 1,
>   };
>   
> +static const struct sunxi_pinctrl_function sun20i_d1_pinctrl_functions[] = {
> +	{ "emac",	8 },	/* PE0-PE15 */
> +	{ "gpio_in",	0 },
> +	{ "gpio_out",	1 },
> +	{ "mmc0",	2 },	/* PF0-PF5 */
> +	{ "mmc2",	3 },	/* PC1-PC7 */
> +	{ "spi0",	2 },	/* PC2-PC7 */
> +#if IS_ENABLED(CONFIG_UART0_PORT_F)
> +	{ "uart0",	3 },	/* PF2-PF4 */

/* PF2, PF4 */ ?

> +#else
> +	{ "uart0",	6 },	/* PB2-PB3 */

/* PB0-PB1 */ ?

> +#endif
> +	{ "uart3",	7 },	/* PB6-PB9 */

/* PB6-PB7 */ ?

> +};
Cheers,
Sam
