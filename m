Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889D328C026
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Jul 2025 08:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751618579; cv=none; b=Uf9eQ7lhb0pT9O5eb3cB0sigZmhb0gFo0LF6ElJO0VH5P1XtTrK50lS/dqq0CWpTjHkSuMzEZeZL5whFUlmzPEPMkN199KUo24Zcb1HBB3fAiiptSnIlW3VZmbhnJKUaRDXPBEdH0sAwrMbW7aKzcbaVOl4TnNoJvrO6JH5NJ4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751618579; c=relaxed/simple;
	bh=XWPuLH+r945MMXMKIDI54FYqxlY/reitRUTj8Ejgnuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKynz8pEuJWEJsldgAn22sPN1QiJMop2YhC9a6SVDOqUMAXFB1qruvFfAA3/vw+vwxrdUtuvh4wK5+vvfcUxrLQQ47kLh3ilCttBd1BxRFtO7HeIupwHKC+8cmmiDg6vcdImrZTr0pFEJzYFDFI6lCIywj+nwXVvukfei6FQG9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fjTWaIMa; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fjTWaIMa"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553dceb342fso732247e87.0
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Jul 2025 01:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751618575; x=1752223375; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWPuLH+r945MMXMKIDI54FYqxlY/reitRUTj8Ejgnuo=;
        b=fjTWaIMaydhQZiaFpnlwhMBwWy34hy2r8kDoGIjI5TIvwIxEHUSsYDuu7LyNanyyV6
         CCwbjuitrH5n9VkZZP5PoIw3/2DhX4AlnLN3emQx0jXk73eY/AUGkLA6MEov9GqNNrTP
         qk4YB3fmdRMG9i8OJFcg1g4fsXdK1NwQ4jJzTQcKl2i4UUBCoRO8/f+2XMPMMQXbs0+n
         qiHW9+EfoobWP75XOTGpVWEX5wSsqVUuzs99cyWbYEWUO8RBlTYvU06nyQhmciaw0+yI
         qF+CXK4ODg+nt22/a7BS0WgyxnaCJEJMoP8LsMYRD3MBURHpeE71wyh8r34i0rg/tVPW
         8PWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751618575; x=1752223375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XWPuLH+r945MMXMKIDI54FYqxlY/reitRUTj8Ejgnuo=;
        b=QmS1PI8C6N3WdOhFWGzQrpTXhS8xHDIaMSGaoKkGMvh3vPjCPeiT4SuOBmJDe+ZkOx
         nEzZ5MkpqeWsdvdI5GfRH0ngVN69+e0rumFLi28Qq0p4TfmrMuxyH0FlS58cs3+TyNZr
         lO96u11fNSzF0rDr/UENyLGbuCJPA47fBziSFmt9EpZy0Jr0B8JVhbPBwaY2henXyccj
         XI2knGChsA0tcRtPJprznAyKBxwuj0TrEa7tu4adbvaPSH7H78Ka/96a92iwOl3c9fUo
         6/1uU/XOUZ9OZ/JrlKPwr4Em+sEzUmITXVvVh5Wd4RracAGIPD4zawWyVqV3FHO44z5Z
         a3HA==
X-Forwarded-Encrypted: i=1; AJvYcCU7g0z3aO4nNxBFEg3/uXVjg7CMJtDklbh6KWksS0Ioo49W8p3eCLZwJBq/mhMLRJ49lGDJCW3a73QHtQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzR/br6PlMXzTRkEfuIo9YJeE58e/P74tLGxfF8dDHdgmz61Uzy
	1cK4thw+kPJY03YMngmYILIj1boBDAgkDru69NIAXyQVIfXqN3O+f4uCfS4Gk0ICy7F/ZNXg7OR
	nU58PitWxMsyCKOrJff8CqI7YtOtsLv4y3vKjunkalw==
X-Gm-Gg: ASbGncvlN4IxQWkeizJy2jw+PVFwrOPwrq9JwUagGeWrCkRq64OsJConfbEjeHvlJDg
	sF+/xhhZaFmp5wNNf4998WftP1uo4LuADugO/omvWMF26rlHzILst7vm0JKOiNAvKc1OE0l8yb8
	HplBoZTyyUE4mgls2TuDYArG4acbISB0Rkg7MwlHf7cvI=
X-Google-Smtp-Source: AGHT+IGodMjqDkDesQdG4Hjakhr0TOM9xUbyJgILsRTpZGqTHkPFTfySztIXo8nEvUZyWt2JWT7aRKctMeet0pwrsBw=
X-Received: by 2002:a05:6512:3e1b:b0:553:35e6:393b with SMTP id
 2adb3069b0e04-556e684bda8mr524787e87.45.1751618574621; Fri, 04 Jul 2025
 01:42:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com> <20250704075420.3219092-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20250704075420.3219092-1-sakari.ailus@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 10:42:43 +0200
X-Gm-Features: Ac12FXznXJQ0ImElx8AS_65o16qEpHJnw8V0OHvMEe3Y5zyTtUuH2rGO4fQjXsY
Message-ID: <CACRpkdb8Z3oLwmB26q1xdHMwa2xTm1sz5g8_a0BHMK8oHsiF1g@mail.gmail.com>
Subject: Re: [PATCH 28/80] iio: adc: Remove redundant pm_runtime_mark_last_busy()
 calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Eugen Hristev <eugen.hristev@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Cai Huoqing <cai.huoqing@linux.dev>, Haibo Chen <haibo.chen@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Marek Vasut <marek.vasut@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Francesco Dolcini <francesco@dolcini.it>, 
	=?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Mike Looijmans <mike.looijmans@topic.nl>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Stephan <jstephan@baylibre.com>, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 9:54=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:

> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
