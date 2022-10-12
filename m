Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909336126
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 21:28:25 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id q9so68933ejd.0
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 14:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8fBRpP3hmDFPN53n4iXfam4Dmp+wv1KkApBTIXMFz8=;
        b=gz9uQcUyTze+E+zoPDXg4B4g3xXceyUfhHvDQ7DTgYFp1GytBqGlHxo+GuV0DtwpJb
         i+5wcxvvqpLTHDkarbZwQAyKVZpBDmQAIEUSPLseMbT3VOAWqi5Uy6oHE5DwI7uF4lsl
         2fKpZT8nqB1vyir2h6cS9jjeEvF4oiSti1AETDDRWldZbjN3xXKREX93WfLFv2xOEEa/
         QtUet/ZiZwyGwfqpfyJNEUh7YwIxkyOJA/DKu7dTZdGJAh04t35k5CwCGwyCTaDLGFd/
         8dSv+mMrRcsat2nsNW3rci7l6BIsQdahvsDpWPR27EVA8mqVed6GYAdsMyhSXvzH9hCG
         CvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I8fBRpP3hmDFPN53n4iXfam4Dmp+wv1KkApBTIXMFz8=;
        b=j5uvPholR52x14xwt5n+SfGwDkfH94TQFu4XDq5H31atYotJy4EAwXExULvSnYEpcY
         STeibUkbh7csBe2+uKbb7/BR7hl3eKSb7yWi81nok8bmMo5oOMuI4hVMiowukAEjboEJ
         ZebIMbkomj15yGwUwYc7ay6rS5ai3sqAmrA0jvO3QKW1GbYluKreS1Fx1RLEl7YpUhfx
         3iqVIXm2/3Rm8fazch3/nosk8tIgP1SbLQrKOGeCqVM0Ptp8Qafni1JFi870NJDIlfAX
         JOzgRygT1z/htnSAOZd24vD7pJdJgbS33U2E7odxDhfx1Bhnn9NaIiZ2e+dG8lihSBZb
         E2NQ==
X-Gm-Message-State: ACrzQf0qrMUIZuZEraNzSzefKCCeMVkhZE6ttjvxumeNYxCmV/m7+xUW
	Urj7ilwXIOt9TT2wwfelQ0g=
X-Google-Smtp-Source: AMsMyM7T57tlAXs8lZ8iAZ/tGPxerp7/euHUaub2p9ONCcS167g4u3dXzSDmOXZFRgdijYtq3qm9Lw==
X-Received: by 2002:a17:907:7b95:b0:731:113a:d7a2 with SMTP id ne21-20020a1709077b9500b00731113ad7a2mr23326617ejc.377.1665610103866;
        Wed, 12 Oct 2022 14:28:23 -0700 (PDT)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id gr24-20020a170906e2d800b007815c3e95f6sm1886716ejb.146.2022.10.12.14.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 14:28:23 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>, Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] sunxi: defconfig: Add X96 Mate TV box
Date: Wed, 12 Oct 2022 23:28:22 +0200
Message-ID: <1803881.atdPhlSkOF@kista>
In-Reply-To: <20221012162610.1968666-1-andre.przywara@arm.com>
References: <20221012162610.1968666-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Andre,

Dne sreda, 12. oktober 2022 ob 18:26:10 CEST je Andre Przywara napisal(a):
> The X96 Mate TV box is a TV box with the Allwinner H616 SoC. It is
> available with up to 4GB of DRAM and 64GB eMMC.
> The DRAM chips require a different configuration when compared to the
> OrangePi Zero2, we must not use read/write training and write leveling.
> 
> Add a defconfig for the box, so that we can easily build U-Boot for it.
> We synced the .dts file already from the kernel tree.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  configs/x96_mate_defconfig | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 configs/x96_mate_defconfig
> 
> diff --git a/configs/x96_mate_defconfig b/configs/x96_mate_defconfig
> new file mode 100644
> index 00000000000..4276f4f543b
> --- /dev/null
> +++ b/configs/x96_mate_defconfig
> @@ -0,0 +1,15 @@
> +CONFIG_ARM=y
> +CONFIG_ARCH_SUNXI=y
> +CONFIG_DEFAULT_DEVICE_TREE="sun50i-h616-x96-mate"
> +CONFIG_SPL=y
> +CONFIG_DRAM_SUN50I_H616_READ_CALIBRATION=y
> +CONFIG_MACH_SUN50I_H616=y
> +CONFIG_MMC0_CD_PIN="PF6"
> +CONFIG_R_I2C_ENABLE=y
> +# CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> +CONFIG_SPL_I2C=y
> +CONFIG_SPL_SYS_I2C_LEGACY=y
> +CONFIG_SYS_I2C_MVTWSI=y
> +CONFIG_SYS_I2C_SLAVE=0x7f
> +CONFIG_SYS_I2C_SPEED=400000
> +CONFIG_SUPPORT_EMMC_BOOT=y
> --
> 2.25.1


