Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E7624523
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Aug 2023 19:56:53 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3497a6119abso703685ab.3
        for <linux-sunxi@lists.linux.dev>; Wed, 09 Aug 2023 12:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691611013; x=1692215813;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OXoVW89LekxSLZkYRM6YlvVulo4pUmYSXPdkECe2Wws=;
        b=ho7fQ2v1j9i9e2AzHcRO5C8LGxkYyjGgsoxZmMaE6fBIXirp1ltwUE4Q8zROLZyfDk
         8+AWfnk2IHSiUNNohl9RCQDcd6GpGAEkbs9+TM3Ca540l4rts0Os1Hb80MHtxbT7Reu1
         Z5J6nRGJZ1QZr3/+Xj5xyv0kRJqqTWWBh8g/gU5irrxFM0dlVqdKahZYbpUWz8yaMqOv
         VSLWha0xY5GCpvGy2eocTcY7TPoMjdXWhfqCNzlLWht1itIOrgb11Khj+ovX/SoghMpf
         9evSX0oPYKJxAx+pdQ0GrDBQXp5OKvIOSk+sQGeThuXK+kA6eO+Mm3WXM6h/4ZU+n9wn
         TvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691611013; x=1692215813;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OXoVW89LekxSLZkYRM6YlvVulo4pUmYSXPdkECe2Wws=;
        b=bcN9FGkvrSHsR996nxkevcD+eQ1fwQCLAJ+7zh3WM7DZCfPaTSoc1yI+ja6ZdLvYS7
         MqE3SjgzqqgGcgJ0/blGqnRKTcUw0dbNo1BYRDcy1rDqvcPNWj+ZBFQ4RIQfCnWx9XEG
         lRe38D1ozXPw/FJHZ4X19lRAet403M0R/t7GY2sJ8L4Bn6sLmpt2OTuqgOrLMYpQiBfT
         FzBaZOIwY/zUab1K6R6Ul7J9inMff9ZwXeMbI/Yxz9COpmt4dR0fg6lTDOrqb+EIQzZ6
         pV2I9cgU7dwLhdNlXbLxoBv1aOhODZD5DVwsrh4sEiyXcblY7Lki0trloxSjdmQp8d/A
         +KjQ==
X-Gm-Message-State: AOJu0Yw6cxVEgTLTngzMlW2YwvOEoz+R2NSnRQYrw51RdiG9NAy1oL4R
	hGNdV0Zcg5B3S1DyJcRu4ao=
X-Google-Smtp-Source: AGHT+IFwJsN+gdkpZ8yU8lACfFFHpN6GVUwjxSqjuHJnSuMzMnoE1kAh4JVyom+G/UD/zmCtpEsJKQ==
X-Received: by 2002:a05:6e02:1a25:b0:345:b923:971b with SMTP id g5-20020a056e021a2500b00345b923971bmr137009ile.3.1691611012569;
        Wed, 09 Aug 2023 12:56:52 -0700 (PDT)
Received: from ?IPV6:2001:470:42c4:101:6e71:1f10:2120:d11d? ([2001:470:42c4:101:6e71:1f10:2120:d11d])
        by smtp.gmail.com with ESMTPSA id a12-20020a92c70c000000b003339733e374sm1383975ilp.86.2023.08.09.12.56.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 12:56:52 -0700 (PDT)
Message-ID: <63fe166d-a830-3682-4ace-2dc6aac630f7@gmail.com>
Date: Wed, 9 Aug 2023 13:56:51 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 01/20] net: sunxi_emac: chase DT nodes to find PHY
 regulator
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>, u-boot@lists.denx.de
Cc: Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
 Maxim Kiselev <bigunclemax@gmail.com>, linux-sunxi@lists.linux.dev
References: <20230721134606.4505-1-andre.przywara@arm.com>
 <20230721134606.4505-2-andre.przywara@arm.com>
From: Sam Edwards <cfsworks@gmail.com>
In-Reply-To: <20230721134606.4505-2-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andre,

Looks good to me! My target doesn't have PHY on a regulator, so no test 
result for this one.

On 7/21/23 07:45, Andre Przywara wrote:
> At the moment the sun4i EMAC driver relies on hardcoded CONFIG_MACPWR
> Kconfig symbols to enable potential PHY regulators. As we want to get rid
> of those, we need to find the regulator by chasing up the DT.
> 
> The sun4i-emac binding puts the PHY regulator into the MDIO node, which
> is the parent of the PHY device. U-Boot does not have (and does not
> need) an MDIO driver, so we need to chase down the regulator through the
> EMAC node: we follow the "phy-handle" property to find the PHY node,
> then go up to its parent, where we find the "phy-supply" link to the
> regulator. Let U-Boot find the associated regulator device, and put that
> into the private device struct, so we can find and enable the regulator
> at probe time, later.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Sam Edwards <CFSworks@gmail.com>
Thanks,
Sam
