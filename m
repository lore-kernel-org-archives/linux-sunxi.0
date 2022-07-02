Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E35A1FA8
	for <linux-sunxi@lists.linux.dev>; Sat,  2 Jul 2022 19:03:17 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id c13so6675789eds.10
        for <linux-sunxi@lists.linux.dev>; Sat, 02 Jul 2022 12:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8UoRIKt+MdEo0nGrpYkHOpyeyu1MYRbMg4sefqGC+RM=;
        b=mtsg3MSK3J7Ilz/+4IHNU3HRqnOz5iVV3E77wemlJRCDVk4MPdPDW5Ile2bdwZkHWv
         grrcYuVF6D6IcHGJd4c/UKe91eoX1+w0lJ9qM7fJiOy4AlffBXVW5g3O79yCV/8mMR8R
         IWZEjOrq3lYyt7QSkaCscZJfBr3T21JaQcbjFmN4RZPTwtNfVSBOUG4g/HWk7m+4s5kv
         a0p7MHPQHEbdp7GtMdcbcTdOeeakfEoxdZVoCHmj3v2aDox+yv6sDaiklwBy6BY5W3/b
         tjHB7C6MvvIoum++4AbrChfPse3iY/tEZr8+92tf6QLSkLMQah2tCQUw2SjJ3urdwHcJ
         tSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8UoRIKt+MdEo0nGrpYkHOpyeyu1MYRbMg4sefqGC+RM=;
        b=PkTYxD/iTWzUsHj+q1SDvt4PJ/PJkcJUy3w4WPA3usgvEuYdhaqaEik66sp1+wtp9w
         ADZt5vCAcLUkz/Nj1QREsgyd32W6kbbPSFwXK+1nGywuZ3bTou64oPV4EAYv/xA2Ms7D
         GjdOOt5G/Dh8c2ukkMmSo/AbVOYjbkGaH8BzhxQRUseCGJL6SizPxMYeSLOSkvFruX+a
         3ZD6gBCyBQue3HXWcx5j0KG4uDiWsI2ku6uYfuqooTJF/6a4epBw1HGonq9NnShLqe7A
         AausTx6f5vK4Uk0hU1eWYfFU6BnWdJfBzg1zD/xOGaqiI/PV3j5ZvzfdGDPDxBP/Jb3x
         n8CA==
X-Gm-Message-State: AJIora+6uckxpho1LVuF+dvMUrMp1Yn0FvkxrcUl0jS5HBE99v0ezUFv
	GHmzOc/Swealsh4ZJ4e0LwE=
X-Google-Smtp-Source: AGRyM1tt1qh/Z1d0og/MUS7fqcR831lmUGX2KsGpkE7Yu8O61Sq+1UGGbg9LqLlFSosuNNxst2cCMg==
X-Received: by 2002:a05:6402:104a:b0:435:c7cd:11dc with SMTP id e10-20020a056402104a00b00435c7cd11dcmr27200063edu.335.1656788595913;
        Sat, 02 Jul 2022 12:03:15 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id w20-20020aa7dcd4000000b0042dc882c823sm17049659edu.70.2022.07.02.12.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 12:03:15 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: allwinner: a64: orangepi-win: Fix LED node name
Date: Sat, 02 Jul 2022 21:03:14 +0200
Message-ID: <21517512.EfDdHjke4D@jernej-laptop>
In-Reply-To: <20220702132816.46456-1-samuel@sholland.org>
References: <20220702132816.46456-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 02. julij 2022 ob 15:28:15 CEST je Samuel Holland napisal(a):
> "status" does not match any pattern in the gpio-leds binding. Rename the
> node to the preferred pattern. This fixes a `make dtbs_check` error.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


