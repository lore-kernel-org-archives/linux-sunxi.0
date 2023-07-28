Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A9817EC
	for <linux-sunxi@lists.linux.dev>; Fri, 28 Jul 2023 03:35:58 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-348c47ca963so6752125ab.0
        for <linux-sunxi@lists.linux.dev>; Thu, 27 Jul 2023 20:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690515358; x=1691120158;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=InIbwVtvt0FytK0SyJbktUFXouwUDYkCnaXPxw52oVY=;
        b=CTlJctYA9aYuKi9D2NJHBBT2C0HqXmbFOq6MvGJO8g675wSvjuHTKzkSZTVqigx80Q
         3QztHLconvyBTZUbkd9IyAFb1s/QOFpLQJPoB2/bP1yjab9yZVj/nuM2DzJqeuuDf/lB
         ueS+gukS7ap9PCnNbxw+cP5N2w4mCDZ3uqTto6UaiKzX/0sWwt++VSM4joxZ/a1uX481
         WPk/zXAR9E3soiP9IMukRgZTLJj8v6qJPjYUT1egUwmg7KNsryxE2VWettW6kkmgwiuC
         F7OVBUBRCQwaaGpzaGgUC4HvxqQrdAEMo9oZuZGiO3K3JyO46/d9wEIMN4Un8w+QkMSN
         iQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690515358; x=1691120158;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=InIbwVtvt0FytK0SyJbktUFXouwUDYkCnaXPxw52oVY=;
        b=a2SppznZIjVQg8zx+AUSTnOQnX0W8sTpMaLdOCo+3s9nGFUabm2dQm0cZrtrsTiwV7
         OO7JJjCgCof+dfahkcL0qu9FXYil4GnWDxVWWX0kWQTvrtRe5aUVuoTL2a2QLyYKMsa1
         ZXlt+6yhya2GdxPTgIYAhXF41ujok9bH78kQCjTTC87uVEPurKZgpBCZJcyEj6kGb6ei
         m7qCHmRYskaG6Y201Gfv75hgW3xJNcPb7hZkcZsV9DGzJn0e0B094gr99rLEXcP1GwQW
         QdzPOk0wudNb2uPPdl2cLIKz/NQ8PS1A0qlWlXTaiDEEtJb8MkHlDq1v3FUSETEjBwCX
         pRNQ==
X-Gm-Message-State: ABy/qLYvA1W1WhKPImmc/VWF7LXtRpml9eJtb4S4Wm66v1pu3IjqrS0B
	AM8EEdelzThAEY/MAtmHvxEjmCrYfMZw0g==
X-Google-Smtp-Source: APBJJlHghknCSaSme2YWJQGYxhzbjklK+OGfx+SDTomBKWZCAoM+pHNCRBFw7PDEES8MJcz9R/D/aQ==
X-Received: by 2002:a05:6e02:1bed:b0:345:d58d:9ade with SMTP id y13-20020a056e021bed00b00345d58d9ademr1609280ilv.3.1690515357955;
        Thu, 27 Jul 2023 20:35:57 -0700 (PDT)
Received: from ?IPV6:2001:470:42c4:101:2c9:1ed4:6c6b:b86a? ([2001:470:42c4:101:2c9:1ed4:6c6b:b86a])
        by smtp.gmail.com with ESMTPSA id g7-20020a02b707000000b0042b1dd89b0bsm824924jam.155.2023.07.27.20.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 20:35:57 -0700 (PDT)
Message-ID: <76aabda6-6390-120e-e583-9b7914cbe15d@gmail.com>
Date: Thu, 27 Jul 2023 21:35:56 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 15/20] sunxi: add R528/T113-s3/D1(s) DRAM initialisation
 code
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>, u-boot@lists.denx.de
Cc: Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
 Maxim Kiselev <bigunclemax@gmail.com>, linux-sunxi@lists.linux.dev
References: <20230721134606.4505-1-andre.przywara@arm.com>
 <20230721134606.4505-16-andre.przywara@arm.com>
From: Sam Edwards <cfsworks@gmail.com>
In-Reply-To: <20230721134606.4505-16-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I've had countless successful boots of a T113-s3 using this DRAM 
controller code, so:

On 7/21/23 07:46, Andre Przywara wrote:
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Tested-by: Sam Edwards <CFSworks@gmail.com>
