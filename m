Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6916FB8
	for <linux-sunxi@lists.linux.dev>; Thu, 18 May 2023 21:10:57 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-510b56724caso228599a12.1
        for <linux-sunxi@lists.linux.dev>; Thu, 18 May 2023 14:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684444255; x=1687036255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GI4smLlSJQa1VUvNaW8lamLC6dslVSxDe/wJI7MniGI=;
        b=hItu/BGU0+PVAlYm6Nh0rvKnuIveJYvyGEWRQPr/b+IEZ7iGXUmd9aQ8W3FdDfGtQS
         rxxqgy+leUxEePBq4hRv8BBi0qwDkWlso61yVgclPuPFdEiRH0om8VivCurHbvla2KTf
         60wIUBu2UBHHOuAMZ7jW2vv6VuopgHCahmO/6tjyfxklEteVhDfAkb8PpvQ2FfqqDzhA
         TC4qnVOsgwlroXwo7Z4ZgcQHYJnuwXgGI8vb8I/RchoWnUzcrDur6H83h//qg8WqV1HM
         vDm+bClF98Er2njckzbBlfLDPhY6oHEaLXGKUyYydc8qJxMuf1owB5Ygq6ofSfIsHR/1
         kFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684444255; x=1687036255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GI4smLlSJQa1VUvNaW8lamLC6dslVSxDe/wJI7MniGI=;
        b=InHf5grFti6fIgf1GQAalWxhYGN797pAN7rPWkImsQ6liLRiT8f0x9TWjOBY4NzB8U
         1KU+cCpG8IzK161rLQ+1MhEYlheu3eBhqAYddB5np2MmBv3bd3Ba3EwR7DZAaXHYiwEY
         Pt3Cx2+7x0ruauzhIGBfHi98wTyNFZkWq6MwftK+nuinsI7FXwiEEuf9MdrkWExd7BFm
         JtpwiSXwyk8/uRGNOMVAt5sdby7kCDEHU5LLsvbxF8XgO/k4Q3g6nvCeFjskwDLilZYH
         ozUURm5TG5NitX7X7jZP8dxIFYj5ddZSVG9fA58DtJVO4eGYyiCXRUx+vstmCV2H+pYq
         Vl2g==
X-Gm-Message-State: AC+VfDzN0kSHUMbthopdI8gnM1vN8ZCkXunAE3D+zSpNjz+t3N7b2N5W
	sfElVMnAy+zVn6iTNx/jlhQ=
X-Google-Smtp-Source: ACHHUZ6DRTl8lUvOL7gbwUgr1bTmPBUj3TbeE9SqccluLW00wGjdEREweB6x3b1roF7SFmjuLSEFVQ==
X-Received: by 2002:a05:6402:274e:b0:510:e8dc:f2a7 with SMTP id z14-20020a056402274e00b00510e8dcf2a7mr3498982edd.7.1684444255247;
        Thu, 18 May 2023 14:10:55 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id dy1-20020a05640231e100b0050bc4600d38sm960823edb.79.2023.05.18.14.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 14:10:54 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: samuel@sholland.org, wens@csie.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, andre.przywara@arm.com,
 Ludwig Kormann <ludwig.kormann@ict42.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v4 0/2] arm: dts: sunxi: Add ICnova A20 ADB4006 board support
Date: Thu, 18 May 2023 23:10:53 +0200
Message-ID: <1850875.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20230510111528.2155582-1-ludwig.kormann@ict42.de>
References: <20230510111528.2155582-1-ludwig.kormann@ict42.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 10. maj 2023 ob 13:15:26 CEST je Ludwig Kormann napisal(a):
> Add board support for ICnova A20 SomPi compute module on
> ICnova ADB4006 development board.
> 
> I rebased the series on v6.4-rc1, I'm also using a new
> mail address because of bouncing issues.
> 
> v4:
> - rebase on v6.4-rc1
> 
> v3:
> - drop stray blank lines at end of files
> - separate patch for bindings
> - update licensing to "GPL-2.0 OR MIT"
> - fix typo: ICNova -> ICnova
> 
> v2:
> - use short licensing header
> - remove deprecated elements from led nodes
> - disable csi power supply
> - add missing pins in usbphy node
> - split dts into SoM dtsi and carrier board dts
> 
> v1 of this patch was sent to the uboot mailing list [1].
> 
> [1] https://lists.denx.de/pipermail/u-boot/2023-April/514605.html
> 
> Ludwig Kormann (2):
>   dt-bindings: arm: sunxi: add ICnova A20 ADB4006 binding
>   arm: dts: sunxi: Add ICnova A20 ADB4006 board
> 
>  .../devicetree/bindings/arm/sunxi.yaml        |   6 +
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/sun7i-a20-icnova-a20-adb4006.dts | 137 ++++++++++++++++++
>  arch/arm/boot/dts/sun7i-a20-icnova-a20.dtsi   |  62 ++++++++
>  4 files changed, 206 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun7i-a20-icnova-a20-adb4006.dts
>  create mode 100644 arch/arm/boot/dts/sun7i-a20-icnova-a20.dtsi
> 
> 

Applied, thanks!

Best regards,
Jernej



