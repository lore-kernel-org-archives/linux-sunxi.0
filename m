Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFC81C2E
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Aug 2022 20:53:54 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id az27so6042734wrb.6
        for <linux-sunxi@lists.linux.dev>; Thu, 25 Aug 2022 13:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=RzEfgQoYNzPoY67n3yQsstMockksnvCgN1zukS3McmI=;
        b=JnQ9KPQhp9ZpmwScAArGIa29Q4OMZwZDqrky/sbNY8FL9Qjz+o558fQ9oCTuVhRgUm
         X0GPPZRPxxLMU7jDh7G/+PVw4E5n1strEdUALkXQKReo8oHKnC0SUKE3QWTLDQeK7W+g
         KMi5DWl8fmiiD+srtwqRi7v6Oe1TgUF6U6/reJvA7D4y8+WTMlhrLI8piYwLXzeP4i5k
         EW+q35t0ZfYdkeaje3AN4zNZqGLXurXPJWo8VhMLlFBfJRUYa4gAJ1haE3J/DYWPbssJ
         XN2aQ4hJ5bSMMaAAlVJFXJzwbQimHoZ3UVmikEv7+M/WZ350vP3OMbcUZWQxDA0erw8m
         qWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=RzEfgQoYNzPoY67n3yQsstMockksnvCgN1zukS3McmI=;
        b=YfhYxo0I9VrS0BwTy7uV8fQGEk3oqFWnqRTRjmsWMqZLpJgrAmvtCOXwxAKsyJSBlM
         YXp3IFq2X9zQFI+ZyA8TLAbggdNIFn2BmxkQRKMcJY3p0NbtjsWNxqhYDBbLjmX//sX8
         pL15cozHg3pVfUpCdEegnGSMMp3AUC25gSrppjvthtX6DC5PCoiWGerCUv6Gwv4q1rEW
         tjMcjoYE6yF5AH11EtWftHlhfaUSc674VOEvPM7jL0ahvmqF7YElKQpxhGnpD0tFtuA1
         96pTmerAItmz5vJ1/ob1r5HOFGbz6lrilAiUjy+tHQbr+BGU5g3uQ9NP2/ieG1fDRwfo
         o/Dg==
X-Gm-Message-State: ACgBeo1rGD6BWUaMryAj4N3elF6fHrTPWb7liIKf7r0hWXtYNu29Tlh9
	I3yM0miABbgEe8q+oZtqICY=
X-Google-Smtp-Source: AA6agR5YJb7JfDU3m31AivaBZ4rJAbMtFKqhzi2a8Ma+GwqO2PCZeFYvDIjHRz6tmC0BSVGr11eaYg==
X-Received: by 2002:a5d:6d0e:0:b0:21e:fc95:3dfc with SMTP id e14-20020a5d6d0e000000b0021efc953dfcmr3294787wrq.112.1661460832523;
        Thu, 25 Aug 2022 13:53:52 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id y2-20020adff142000000b0021f131de6aesm192612wro.34.2022.08.25.13.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 13:53:52 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: defconfig: Enable devfreq cooling device
Date: Thu, 25 Aug 2022 22:53:51 +0200
Message-ID: <8106124.T7Z3S40VBb@kista>
In-Reply-To: <20220821173051.155038-2-peron.clem@gmail.com>
References: <20220821173051.155038-1-peron.clem@gmail.com> <20220821173051.155038-2-peron.clem@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne nedelja, 21. avgust 2022 ob 19:30:48 CEST je Cl=E9ment P=E9ron napisal(=
a):
> Devfreq cooling device framework is used in Panfrost
> to throttle GPU in order to regulate its temperature.
>=20
> Enable this driver for ARM64 SoC.
>=20
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index d5b2d2dd4904..109004e44d21 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -584,6 +584,7 @@ CONFIG_SENSORS_INA2XX=3Dm
>  CONFIG_SENSORS_INA3221=3Dm
>  CONFIG_THERMAL_GOV_POWER_ALLOCATOR=3Dy
>  CONFIG_CPU_THERMAL=3Dy
> +CONFIG_DEVFREQ_THERMAL=3Dy
>  CONFIG_THERMAL_EMULATION=3Dy
>  CONFIG_IMX_SC_THERMAL=3Dm
>  CONFIG_IMX8MM_THERMAL=3Dm
> --
> 2.34.1


