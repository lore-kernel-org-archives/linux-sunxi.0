Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B6515CAB
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Nov 2022 13:42:16 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id z17so2740495qki.11
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Nov 2022 05:42:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rbRh/ro3AF7kveHByL39OkW+4w9BfWleF28OTQj/Mw0=;
        b=WNZGc8huBeKW9ZgvaP8wRsI8T+3HgbHz/kRzYXZ4Xq8+UMFs/H7xxwCRC4jcV/LtnE
         5h2D42UatPtsMbQSdj7o/EH0SA1Eju/nv4faWOHDx9KVqU7hC+1+X/flAhtFDPUHBzSW
         U6vQMq3Bd6uz4b22iXNAJOHxuWTBGDkdvOSOPYnLPLirCbCeYsuWvXuajHZuZXOfYmIb
         iM1nYmMXuvw4j11MbJ6YJaP0PKbscn4npQ4/uDuJ+B0PkCrYoyS4fWx27Lv4xBu8qR4I
         47Cv8Mx5LXIe548d2uDjjyGPkwHX6QVc+3+ZtO5HROu4TBdV05y2EW0n/+qyrN+SYgtD
         RqfA==
X-Gm-Message-State: ACrzQf2sxgmiHS6Rjk7PR9XcqgjXjMQW1lyWY+6MhgVR4SKoqGnyjpKO
	PdCyUSFW+NKs5FI4g5mP+G2dQzkV/jGGzVy7
X-Google-Smtp-Source: AMsMyM7K8IJeZh8xjd38J5QilcONVNknKOWMVx2SQHM/tJ7Geg/7WyAvXOajN2jUekD79tEKyzJDrg==
X-Received: by 2002:a05:620a:f03:b0:6cf:c0a1:20bc with SMTP id v3-20020a05620a0f0300b006cfc0a120bcmr39149292qkl.663.1667914934787;
        Tue, 08 Nov 2022 05:42:14 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id w40-20020a05622a192800b0039953dcc480sm8174070qtc.88.2022.11.08.05.42.12
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 05:42:13 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-3701a0681daso134051367b3.4
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Nov 2022 05:42:12 -0800 (PST)
X-Received: by 2002:a0d:e301:0:b0:374:a8ba:99b0 with SMTP id
 m1-20020a0de301000000b00374a8ba99b0mr7181781ywe.358.1667914932477; Tue, 08
 Nov 2022 05:42:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech> <CAEFVmOKCTc_ZrFyCxiSwCmhtjJj_fzr6n99cWtb9aECFzzYVXg@mail.gmail.com>
In-Reply-To: <CAEFVmOKCTc_ZrFyCxiSwCmhtjJj_fzr6n99cWtb9aECFzzYVXg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Nov 2022 14:42:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXDK6-wDjpx27KJd4_gwoXQWcP6qctN-zvG6OrUgYtGAA@mail.gmail.com>
Message-ID: <CAMuHMdXDK6-wDjpx27KJd4_gwoXQWcP6qctN-zvG6OrUgYtGAA@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH v7 00/23] drm: Analog TV Improvements
To: Lukas Satin <luke.satin@gmail.com>
Cc: Maxime Ripard <maxime@cerno.tech>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Ben Skeggs <bskeggs@redhat.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Emma Anholt <emma@anholt.net>, 
	Karol Herbst <kherbst@redhat.com>, Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, 
	Dom Cobley <dom@raspberrypi.com>, nouveau@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, 
	Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Lukas,

On Tue, Nov 8, 2022 at 2:20 PM Lukas Satin <luke.satin@gmail.com> wrote:
> One can switch from NTSC to PAL now using (on vc4)
>
> modetest -M vc4  -s 53:720x480i -w 53:'TV mode':1 # NTSC
> modetest -M vc4  -s 53:720x576i -w 53:'TV mode':4 # PAL
>
> NTSC should be 640x480i, not 720. It will probably work on most TV's, but NTSC by the spec is 640x480i.

The above are actually the digital ("DVD Video") variants, which have 720
horizontal pixels (incl. overscan).
The analog variants do not have a fixed horizontal resolution, except
for bandwidth limitations.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
