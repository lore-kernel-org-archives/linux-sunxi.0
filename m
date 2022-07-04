Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D4046BF
	for <linux-sunxi@lists.linux.dev>; Mon,  4 Jul 2022 20:26:05 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id r6so1505283edd.7
        for <linux-sunxi@lists.linux.dev>; Mon, 04 Jul 2022 13:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1tJIxz5ezajZKza1h78R8fmlrf7RERifYbGM507EmBE=;
        b=ccv1cqJAZDDLfohSVkllVuLjbgxVsqMkB8cqyWqo1Ar0DmxZ3EcEmoAK3V8kc6jvaM
         YvZ+qCLTB0yXV9EuMAav21XL4shWfYu11tR97moxDWTCjtAgUYE6rSyziVmr0tge0yZx
         fkeOuHn+sVoZLINJqG9n8Zprw45jqDD3QFv0Jz7G9sOBK1akE2qPYOwabvYux3Fe5PT6
         vWoEPv2tA3KhFhDI98LuPhrASolXYnU/EbobNl7ELiS/+EdIFBe2LehPglCyYJDBpftL
         3FLQhWkzm7/8e1sncf0LhTtPXN+ijjsn31WOS7/aFAEtyuLxPHzpQLw83N6Yu59gQxas
         2aJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1tJIxz5ezajZKza1h78R8fmlrf7RERifYbGM507EmBE=;
        b=MOKIU02YJeayVzT4yX7U25fY8XnEyXsPkHsanVVjuZbkNP3gJHs0MQlFBgbqSRt0mQ
         Cqp7USGJjb8V8SwNFsnFMgePJ93rs12jCNYrFRO/2mFD6gHw2STwIMg/g8GFmlB6pi8u
         IeN8O+85wKHp4LjEYAh0XgDuMLsxxW1Y4tpaudxClYIPwIKsa4481S7qc778du6n0/2E
         et9j+d4oJ8x2P8LOpeTl1cpvUeSox7AUYLqKZUPgIKyPgaGBSyghSsDQOElFXNX6KpXp
         2M95FTDC1lZqT9jQ1fqMMoSnFwWgrspMSjRqb38jo2Q3HAbN5kf8AHpiVwryN7oDKcPL
         GUxw==
X-Gm-Message-State: AJIora/Iwgn3ZwvgQKQn/dZhAK/yEXigbLwkKeZFrPrFLN93IBOZxI3g
	ITcJK9Fke/S/rgbKi5KTssU=
X-Google-Smtp-Source: AGRyM1sampbUz6y4KfVXdkWjW2A/GCw/gASMZ/wjup1d+riy2rElxKRVxi48y7n9vSccHlO1o5zJRA==
X-Received: by 2002:a50:fd16:0:b0:435:9170:8e2c with SMTP id i22-20020a50fd16000000b0043591708e2cmr41357313eds.216.1656966364098;
        Mon, 04 Jul 2022 13:26:04 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id n18-20020a05640204d200b00435a08a3557sm21499039edw.27.2022.07.04.13.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 13:26:03 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>, wens@csie.org, Mark Brown <broonie@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] arm64: defconfig: Enable Allwinner built in CODECs
Date: Mon, 04 Jul 2022 22:25:57 +0200
Message-ID: <1865047.taCxCBeP46@kista>
In-Reply-To: <20220701112213.1765599-1-broonie@kernel.org>
References: <20220701112213.1765599-1-broonie@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 01. julij 2022 ob 13:22:13 CEST je Mark Brown napisal(a):
> Allwinner provide an audio CODEC as part of their SoCs which is used on a
> number of designs, enable the driver as part of defconfig in order to
> improve coverage of this in the various automated testing systems.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Samuel Holland <samuel@sholland.org>

Applied, thanks!

Best regards,
Jernej


