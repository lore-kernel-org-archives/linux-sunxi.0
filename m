Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8084A8F
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Mar 2022 15:18:15 +0000 (UTC)
Received: from mail-wm1-f51.google.com ([209.85.128.51]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MgRYd-1o5biM3KxT-00hxnj for <linux-sunxi@lists.linux.dev>; Tue, 08 Mar 2022
 16:18:13 +0100
Received: by mail-wm1-f51.google.com with SMTP id p184-20020a1c29c1000000b0037f76d8b484so1718067wmp.5
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Mar 2022 07:18:13 -0800 (PST)
X-Gm-Message-State: AOAM532dRf0xokO3w0Y1sGRZEKBSIyjaPqowN7eFWX95K/ct3vLO/57X
	6t+RpcnuYMxVCc+QblN+TVjPOwHQzlYDtRsbxXs=
X-Google-Smtp-Source: ABdhPJwWnege0B89hH2GkrjFsd8ZOdfeG5z/xIwKnV2rzC8zB4ilKLYWFNkX7PGEBAA7XOORN9saQgPD0j03zWqy5ZY=
X-Received: by 2002:a05:600c:154b:b0:381:8148:64d with SMTP id
 f11-20020a05600c154b00b003818148064dmr4020960wmg.98.1646752693479; Tue, 08
 Mar 2022 07:18:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220307143421.1106209-1-andre.przywara@arm.com>
 <20220307143421.1106209-14-andre.przywara@arm.com> <CAK8P3a1FxfZj0=T=cvLNfagP+c_d+SEYYuV30+-UTU+B+HVXmQ@mail.gmail.com>
 <20220308120750.0bbe0122@donnerap.cambridge.arm.com> <99029bae-cf1b-c3c1-004e-8a6795d19f7f@microchip.com>
In-Reply-To: <99029bae-cf1b-c3c1-004e-8a6795d19f7f@microchip.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 8 Mar 2022 16:17:57 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0ogA_b57N_yOjARfh9Gmox+KUrOcP5eE_frSD5YXJJsw@mail.gmail.com>
Message-ID: <CAK8P3a0ogA_b57N_yOjARfh9Gmox+KUrOcP5eE_frSD5YXJJsw@mail.gmail.com>
Subject: Re: [PATCH 13/14] ARM: configs: sync multi_v5_defconfig from savedefconfig
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh+dt@kernel.org>, Mesih Kilinc <mesihkilinc@gmail.com>, 
	Icenowy Zheng <icenowy@aosc.io>, Jesse Taube <mr.bossman075@gmail.com>, 
	Giulio Benetti <giulio.benetti@benettiengineering.com>, 
	George Hilliard <thirtythreeforty@gmail.com>, DTML <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	Russell King <linux@armlinux.org.uk>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:BzIi6eN7hv2nxru6vAhpkG7DJ2TbuMU4lrnI8SByYjJlEvzQDtU
 +FPaD/wTCvRFKzTxPNV9Z2fo8WsRlXKKhgzZqsqRZEGQMUwxGzm1njXNciUrUmWUcTe9t24
 AnHGsXjruT7LpJZvJ5PrsvJv00bh/Rv7L+xzX6U3keFtlB0XcsFQuVO2kHy91FKp2WIUbTE
 Y1noJXlu5IF1gqxrS2dNA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6mo+U4a1njw=:8ztzpDih7rq31UmpIDB7L0
 ohtcXThD2UB4+kVTew6RMQvNulAgZuDBh8COysL/t6qfQCEimnM/mT3Ecl6McXBi8VCwlqkkG
 JuxCmCI2Z4zOASonWP32LWsZbEtkPAgLcaguzD9tfUJ9vBIfOVeU8hKw294+/6v3Pwdsd0y3Q
 0rFPrqxU+aDJkEX4nKoQVIZFEvsjPasP7lFJLG19iMuujlU0fLxAp0FoiaLlBAJUtxz321vgk
 nIHxuc7QohX1bB0KtodGdSk3+aHnQj9ppZiwFl5OEdTDlT+R2AGkOnLms4ErD2lMejfZgYXAj
 8ZHbOP+L51lM8FDWgIwFwGCBXZFPQPLsgJeFKiXGs3CUBzYpvWvN9d7O5LV2nc9EPJjSYXzUy
 RF9Xpq5tSP5XDyGOVXs7xvA7Kc6FC4PaTmw/cR61WKoNWu/AzxZOQqJzDgyrznxTGDdgQohMj
 b0n61tY6dbvT8ubHxQHxE8PPQVDfxjBfc4VUux73q8l/D8lBSX9Q8g70ej3Nil+mf1r129jn1
 rtvgAY0SQuYJKMrD3HHVcZZD2joYlVGghBCHXoYaS4EvC3FzKyvWMv59+bmSyx1UgB4t/aWrI
 7EtSJuP4m4/+hErvWROo7YMR6bBnbNTN5dfMjSstfeKM+IBXWApwizCPAsME9uyvWw8uk8mYF
 yNxMlC63aUMqASuIYMUzlde8VikGSMFaR8aIvUbz0mfIZURsONgvSmkE00JM4jnkfkW0=

On Tue, Mar 8, 2022 at 3:30 PM Nicolas Ferre
<nicolas.ferre@microchip.com> wrote:
> On 08/03/2022 at 13:07, Andre Przywara wrote:
>
> As far as I'm concerned and only talking about the drivers, I would
> prefer that we keep the following config options activated in the .config:
>
> CONFIG_VIDEO_ATMEL_ISI=m
> CONFIG_DRM_PANEL_SIMPLE=y
> CONFIG_FB_ATMEL=y
> CONFIG_BACKLIGHT_ATMEL_LCDC=y
>
> The question to know if they are activated by default or not and if the
> associated stack is selected or not, well... I lost track of this, sorry.

These are actually missing, I think the two options we need to
enable are:

CONFIG_MEDIA_PLATFORM_SUPPORT=y
CONFIG_FB=y

All the other options that get removed are either now the default,
or are no longer part of the kernel.

         Arnd
