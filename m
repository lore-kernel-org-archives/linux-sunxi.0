Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5A73D65
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Aug 2022 14:15:09 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id s22so3600658qkj.3
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Aug 2022 07:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=+LNH7GWYgSUzsjvph8IQNcroBifhiDios4fo6CTY2/U=;
        b=gDehi3re1kwUEkajavxMc858VJwQON4TwuiNI2fNJnogsBVGQiqIFpWEtPm1gg6Oqm
         3sJP8lVFgGbENJyMdsnDkUj5R4qlbjEt2VgdPWXWE5T9d28Q8o7CSSTlmQIu+Q8Jc0pT
         upAvRz2bTQBKzZil87Ip19tzpKYritO2x1NLJvMf0m4keG0a6A9n49qpYlQyFqzbQ2ff
         rrWwe/A5qpgCg/zb+ztUSb1nhPdb5ThJxP5FTPdQQ6jYwA/L/QbIXgtj/HSJm6BT4Qp6
         YYMgrHNmQ1u5S4lWa25PwCS91fpRvPI+iQtYLlurs01+yACXe3vYt8HFqbxi3cV763nh
         B33A==
X-Gm-Message-State: ACgBeo1ylIekKo2rGm1dqwV1zqE+ZrQu52bCh/Px8D5PkIDgbEZY9Mgy
	E+lgv4OVsMR1nqC7zFCQojGijng4DmogZQ==
X-Google-Smtp-Source: AA6agR4/8xGSvUSBbyovpKqvR7gmRelG8/XNfB3N1x5PtRWm9ajxf0gRCjbcdzn7X3OhOyZ2Ge2+sw==
X-Received: by 2002:a37:94d:0:b0:6bb:c0b6:a90e with SMTP id 74-20020a37094d000000b006bbc0b6a90emr8392132qkj.5.1661782508447;
        Mon, 29 Aug 2022 07:15:08 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id d12-20020ac8060c000000b0034454aff529sm5166833qth.80.2022.08.29.07.15.06
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 07:15:07 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-33dba2693d0so198202707b3.12
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Aug 2022 07:15:06 -0700 (PDT)
X-Received: by 2002:a25:415:0:b0:696:814:7c77 with SMTP id 21-20020a250415000000b0069608147c77mr8612505ybe.36.1661782506395;
 Mon, 29 Aug 2022 07:15:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAMuHMdUusnhYodWGCxJBu-1Hd2KW-xdT8jxE_iVdQjDo8b3Y5Q@mail.gmail.com>
 <20220817131454.qcuywcuc4ts4hswm@houat> <CAMuHMdVPEgnnsY-4uuf=FDJ0YxWpch-0kZWFT_TZfcDvXLtwWQ@mail.gmail.com>
 <20220818123934.eim2bfrgbxsmviqx@houat> <CAMuHMdWXbHkrBZgsmUnU=q52+q7UZZNO3tgQW7Men+msQ1JDwQ@mail.gmail.com>
 <20220818134200.cr22bftmjn226ehn@houat> <CAMuHMdX6dyQaB34oeXwiCa2rDkxks0qNh=ekqh7Wd2kSNED9TA@mail.gmail.com>
 <20220818154641.ouvrar5s74qu74zn@houat> <CAMuHMdUjE0mwu8z5AksW4h1OwzDCQ5h1ZoCWDi+rC4p2Pu5O4g@mail.gmail.com>
 <6d1dfaad-7310-a596-34dd-4a6d9aa95f65@gmail.com> <20220829132953.sfv5yex2dhv76vrq@houat>
In-Reply-To: <20220829132953.sfv5yex2dhv76vrq@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Aug 2022 16:14:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXxoEYV7v-R+o4eMJEiV_xGUgpN6sUbZ95r_qewV5QpRA@mail.gmail.com>
Message-ID: <CAMuHMdXxoEYV7v-R+o4eMJEiV_xGUgpN6sUbZ95r_qewV5QpRA@mail.gmail.com>
Subject: Re: [PATCH v1 04/35] drm/modes: Introduce 480i and 576i modes
To: Maxime Ripard <maxime@cerno.tech>
Cc: Mateusz Kwiatkowski <kfyatek@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jerome Brunet <jbrunet@baylibre.com>, 
	Samuel Holland <samuel@sholland.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, 
	Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	linux-sunxi@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Phil Elwell <phil@raspberrypi.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	DRI Development <dri-devel@lists.freedesktop.org>, Dom Cobley <dom@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"

Hi Maxime,

On Mon, Aug 29, 2022 at 3:30 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Wed, Aug 24, 2022 at 06:42:18PM +0200, Mateusz Kwiatkowski wrote:
> > - Speaking of closed captioning... a lot of different stuff were put in the
> >   blanking interval over the years. Like teletext in Europe. There are projects
> >   like VBIT2 <https://github.com/peterkvt80/vbit2> which intentionally
> >   reconfigure the Raspberry Pi composite output to include the blanking interval
> >   in the framebuffer so that teletext can be output by drawing on the edge of
> >   the "screen" (from the computer point of view).
>
> I'm not sure how we would support this in KMS to be honest. Asking for a
> wider mode and the userspace putting whatever it wants in the margins
> seems like a good choice.

s/wider/higher/

Teletext is transmitted in the "visible" parts of (horizontal) lines, but during
the vertical blank.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
