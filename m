Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9D07E
	for <linux-sunxi@lists.linux.dev>; Wed,  7 Sep 2022 08:14:50 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id b5so19100228wrr.5
        for <linux-sunxi@lists.linux.dev>; Wed, 07 Sep 2022 01:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=WNKKGWN+WFUu1oa3BX6+NmApFTzWRBHzKK4NOWIbTqo=;
        b=SZDDwsi0AoB2G4+KibXTfTibP3Oppkq6dveQcXInabz6Lemcdu5SL2sFUspyVKzz2S
         PGL2Jxscgtr7Vv82xViWHea2t8H6H3wUKSpyIlgzVY7EuyoArMJWz+FTgI3c90iOHOFP
         cIA+5BHuphOsOuDZ88Ec9Aa7yPHIxbx0HMfWNXP4qvTLCD+/v5XH/2HbR24JdpGUGzId
         1ELkQO/iPwwljHvxRr74jhVWAtzllVPBGVoCw7ctvSZW7xaF8V3S/wN2hWNLpgzoqYsL
         6ELR54wpnI3Rf+YA321Wl6NrqRRcv/rYaVPdSaytIdiy58yvh7TPfzRdk94sWnZ7YOYk
         Kd0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=WNKKGWN+WFUu1oa3BX6+NmApFTzWRBHzKK4NOWIbTqo=;
        b=Hkc61t5BhTl4RLXIeHaLFbYbbzXSzIon276gkhcxtBYoRPbIXFb9MeIvKq18u5aVWN
         2JIj4CFJm1ySHH6n1GxS2l+cyElLPbLh/ILMtONeXUgo4P5mJ8Ev3cx74jkkI6MM+TTo
         9/GoIVBNibyPYSGYK5XgkD8YUaUSQ61hOfMtsCsuo6uJqysyRcfC1sM1CD62dap23hnU
         nZCpJr6rEwkuua+qQfbPaT/aCQikUlccjpfO43aifff6xcUaGe91AFFCki8u8a4Skr5K
         gbBZvosMbYXJsjMNlq30tM0vzeTKkTDBhky5ZpL6ZW9dpmZdfmaWQq8uEv3KxU9N4AjH
         +QQw==
X-Gm-Message-State: ACgBeo1vpd7MDICAuAudRxu7wDoztQ/thZ4LlqNIxsOz46fRtkAhgNK2
	R/Gt1Oz7BPUSASCvhv0duYveDQ==
X-Google-Smtp-Source: AA6agR7U0b4uvQP/9XxTMhY5KOg/uOkGhISPokUyB6IpUnggVIGAc3fQEfsiDBnibuM3vwsq30Y8HA==
X-Received: by 2002:a5d:5489:0:b0:228:94fa:9caa with SMTP id h9-20020a5d5489000000b0022894fa9caamr1285103wrv.227.1662538488801;
        Wed, 07 Sep 2022 01:14:48 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id t64-20020a1c4643000000b003a673055e68sm29260780wma.0.2022.09.07.01.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Sep 2022 01:14:48 -0700 (PDT)
Message-ID: <def4f82f-7438-b29e-dc1c-f971aeee0448@linaro.org>
Date: Wed, 7 Sep 2022 10:14:47 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RESEND] clocksource: sun4i: add definition of clear interrupt
Content-Language: en-US
To: Victor Hassan <victor@allwinnertech.com>, maxime@cerno.tech,
 tglx@linutronix.de, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20220906052056.43404-1-victor@allwinnertech.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220906052056.43404-1-victor@allwinnertech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06/09/2022 07:20, Victor Hassan wrote:
> To prevent misunderstanding, use TIMER_IRQ_CLEAR instead of TIMER_IRQ_EN
> in function sun4i_timer_clear_interrupt.
> 
> Signed-off-by: Victor Hassan <victor@allwinnertech.com>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
