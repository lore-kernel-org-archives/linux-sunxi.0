Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E7246BB
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Jun 2022 20:24:52 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id u12so21464392eja.8
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Jun 2022 13:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/kOow9vitS6PwBDRVMXZUrJIKbzM8TurUiTbE4cjhJ4=;
        b=A0Enxr6I6cTRhN63dLpe6rDqZ3D79PzQxc9oz1zz2lIrHjLxPZCVurJiXm89ZWhHH/
         m4YNqRqNgvXWdIUg450/RJlldqXJ34xjWFVlbdJiVCj3oTmUeD2V77j9hmhXKnlo3zf5
         RiEZ2bw+Fd6FzWkC8jGWdNJ1gGsAJVAItAuMW/dvgWAzfhPNlmkvDK57sBJGPeXk2brY
         YYAqaDimsa9Te3WTRN82SuXqzEYfaByw/OSQBUgio4JrmGWkjVLf6J1k0Id2mR5NEHIy
         QMZORRdWigc4xtfmDZE0YDXwVHc+U6BRHGIj+Dp91NZhGRJiRZULn+CBoB83oZmjYk7x
         75FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/kOow9vitS6PwBDRVMXZUrJIKbzM8TurUiTbE4cjhJ4=;
        b=uY+0oC6wzas6Dn78I0nepKujHl0YwyuIF0wOqwrHFXmwKhplk9ETrRgzqj8N84Uj8K
         SkONgYcwwnol/M3pM0hOGrNcnTre8mbjKBxnTVBeRK2pNhp1QLjGs5te70+kRjizuk3G
         GyWz6Y2nKOAf0VKC6pxeTiPMWdetWP+V358zvtshPJnXEY9I8OZGyLbj/7lETGJnjCHK
         zigIb+xZ3YzzjR0zkP+s3EzFeithapL1hybmih18w0io8KuXKoXpdhTnNMoEAnxhAh1p
         YDndLMUQHROSKWEmKJjgSAIlxPyScvof2Mu6VjN+QeSlhMSthDHrdFd3cTk3x+43qXZh
         Tf7g==
X-Gm-Message-State: AJIora9Cy43VSDmTDTbLpa2kdcBp6kpBOd/63f6GoNl87GyKarl1mU5I
	whWgR0U5zRPKpLsVlrmb69k=
X-Google-Smtp-Source: AGRyM1ucO41refGoDSFrPDo7tl8WOhspo5azxD7hXvL5SqjtjYyW8BRdSebUwVQIweoQxmtDlm9+AA==
X-Received: by 2002:a17:906:7007:b0:6ff:8028:42e with SMTP id n7-20020a170906700700b006ff8028042emr14573895ejj.278.1656361490665;
        Mon, 27 Jun 2022 13:24:50 -0700 (PDT)
Received: from jernej-laptop.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id p22-20020a170906605600b00722c44f9301sm5311968ejj.224.2022.06.27.13.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:24:49 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Samuel Holland <samuel@sholland.org>
Cc: Icenowy Zheng <icenowy@aosc.io>, Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [RESEND PATCH] rtc: sun6i: add support for R329 RTC
Date: Mon, 27 Jun 2022 22:24:48 +0200
Message-ID: <12003397.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <20220626042756.58961-1-samuel@sholland.org>
References: <20220626042756.58961-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 26. junij 2022 ob 06:27:56 CEST je Samuel Holland napisal(a):
> From: Icenowy Zheng <icenowy@aosc.io>
> 
> Allwinner R329 has a RTC with a similar time storage with H616 but a
> slightly different clock part.
> 
> As we have already handled the R329 RTC clocks in the CCU driver, add a
> compatible string to RTC driver to allow probing of the RTC.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


