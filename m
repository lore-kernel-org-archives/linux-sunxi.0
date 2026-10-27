Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793110961;
	b=riDvi1yMiQq5zDySrefRcEXC9FOXOo5d1CToFmW9KBkX8eh7VFuI8iEW36cKKg3Sx0DU
	 XujmK6Tjv4LnQP5gsI4pGJNlLoQ6rAKvbY5sZDKYRDRct8vLVMDBW9iJZLJogCEH8unzR
	 djsd999Tz7Uof35RlOMd5zUqFiBq/aL3BbaWEPiRWM8e0MPyeFGrNlTYD7gZFCYQLhM0d
	 SX+121+XPCfRjyLyIaHwHyKAZrERlQy1pJK+5Ez9GgMTQpsZ8tcYMoCFMzdBguZ37o8bS
	 Q9ZB/AaSA/TRuUDxJX4RoLXx1tRnif1klECL2PjFIr2wzcAGkiLDS0d0MtDSzhROZRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110961;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GaS9DIAzMYp6Tb26jgRNliWQoK7YtOPDgti3i8/xKo0=;
	b=Iy89OqbwLBdncdL/O0wkBan16NLyB7CE/66Hf/aXzK+4T4lXGY2GleCL2rQ4wudwXo9Z
	 k+4RDFEdf+usgNkLO+bxn2iSBirLQ8g2N+KlyU3Geof1zZR2hernEFUvjdAAgKdXTGUBB
	 m8K36KLrq/RS8aAPvTys8Im7T0N+FRvQ7hiwMMNITVt/gOCucspxKyWhvOGZKVJBtYloL
	 JI/11ioNpGiO9xB3af9Eek9zQlf5v3Olfnh5PaE2ScR/vrTQ9WpmaLmlPpB6SYhHhHbtt
	 NQK709PlGpe3vmsroa0wqzPNNTJKf6lhBS3BLV5lQQFm1xJ/RzbXpr5z6zumOSABcWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NWsafbg3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FF7606A31A
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Oct 2026 14:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NWsafbg3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A72261F01825
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Oct 2026 14:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793110960;
	bh=GaS9DIAzMYp6Tb26jgRNliWQoK7YtOPDgti3i8/xKo0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NWsafbg3XEADKZm3x/wbC5f/PUKjCQiFPnk5bWiJ4sOr1/S8XfbrSVQAooOHUz7Yu
	 Of4uLmLvjeqEDTMcMJqX+uUg+5DCoUg99qcQcCybB1PbOhuOLiuVjgGeBEICbDJ6Y3
	 1iEuGuVzWMjKV/HsBqntv9tr5vv29rsuye8RfPj2J9vwhIPxtyyQKAjuOF99lhV+Yv
	 di02gF5dISAr+BEx/HqV35HXl0dhxHCsGGi8zk3UhUyQuchQ8W7hE2sdrcEr5RvShP
	 4D9gN3JRmdAeh6JJzoxMO0Z/Vw2jrRGb+q7UiF7/RmtWcsPA7ZnqGheqcDtDOvzDc5
	 LjfFWvWLviNWQ==
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6dd059478dcso2916932eaf.0
        for <linux-sunxi@lists.linux.dev>; Tue, 27 Oct 2026 07:22:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwEOW11XK9h3pYbUvGtpUKpJimrX5QqD7BaRXB0H+4mQUqqvIZrk/v2QhQ2MVlthiMai0HJappya1hPtw==@lists.linux.dev
X-Gm-Message-State: AFq9FYIegrY+Gx9kPu2A8X5R14qpLqUnLTFg5uyj0Zh5gBvuaS/IxJUF
	AHKuXU9Aj/BioQoLwafP1BtqD4fF5KhfaoAGG6vGGnNttcQ6TKS504ZkAzeNpxYP9BoCNXms/t7
	Cx6fi5mh3m09wknrsl6/2rjmKjSPsR9w=
X-Received: by 2002:a05:6870:2189:b0:4a7:5508:c526 with SMTP id
 586e51a60fabf-4a83f42f572mr6040267fac.21.1793110491448; Tue, 27 Oct 2026
 07:14:51 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com> <20261026-drm-panel-funcs-v1-10-5e3070a3478f@oss.qualcomm.com>
In-Reply-To: <20261026-drm-panel-funcs-v1-10-5e3070a3478f@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Oct 2026 15:14:29 +0100
X-Gmail-Original-Message-ID: <CAD++jLnmuXaoKDLyCsPzUBYohOxqjVGVndz0047vmhZFgvvo6A@mail.gmail.com>
X-Gm-Features: AclHuK9bjg1W8yVOv6xb18mY_G1euLOiDqjDsy95KUm0kaVExInNMT0MB46F2ok
Message-ID: <CAD++jLnmuXaoKDLyCsPzUBYohOxqjVGVndz0047vmhZFgvvo6A@mail.gmail.com>
Subject: Re: [PATCH 10/35] drm/pl111: use drm_panel_bridge_add()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Douglas Anderson <dianders@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Alison Wang <alison.wang@nxp.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>, 
	Javier Martinez Canillas <javierm@redhat.com>, Igor Reznichenko <igor@reznichenko.net>, 
	Michael Walle <mwalle@kernel.org>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	Jagan Teki <jagan@edgeble.ai>, Jianhua Lu <lujianhua000@gmail.com>, 
	=?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
	Purism Kernel Team <kernel@puri.sm>, Jerry Han <hanxu5@huaqin.corp-partner.google.com>, 
	Joel Selvaraj <jo@jsfamily.in>, Icenowy Zheng <icenowy@aosc.io>, 
	Michael Trimarchi <michael@amarulasolutions.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Casey Connolly <casey.connolly@linaro.org>, Michael Tretter <m.tretter@pengutronix.de>, 
	Cristian Cozzolino <cristian_ci@protonmail.com>, Junjie Cao <junjie.cao@linux.dev>, 
	Ryan Brue <ryanbrue.dev@gmail.com>, Nickolay Goppen <setotau@mainlining.org>, 
	Stefan Mavrodiev <stefan@olimex.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Robert Chiras <robert.chiras@nxp.com>, Alexander Koskovich <akoskovich@pm.me>, 
	Markuss Broks <markuss.broks@gmail.com>, Artur Weber <aweber.kernel@gmail.com>, 
	David Heidelberg <david@ixit.cz>, Dzmitry Sankouski <dsankouski@gmail.com>, 
	Yedaya Katsman <yedaya.ka@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 12:10=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> The connector type passed to drm_panel_bridge_add_typed() has been
> ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge into
> every drm_panel"), the bridge always has the type of the panel.
>
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
