Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACB8366
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Aug 2023 08:19:19 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d62bdd1a97dso586367276.3
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Aug 2023 01:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691655558; x=1692260358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78OX4fId0Em709uz0mp6uxgk8bb4IwlDXBz/uTj2fjY=;
        b=YAetKf4q0nZa/dO71z7++J7KKpe1E1CC7O3ahafQ7APpHv5jmvyn5BBv2mwDpYC5is
         aCqkyV5eahWJcbkNVk0H4ZuATN+jOIeGgJTiNul2i5t9tXVMigNJA6VlxX/a8OMvNSIA
         YaLs/IE+usEOobqLkPYKtN3CknTSd/aP7iBrjDMEftqOkGi4Hzn8W27JugL/elhtZAtS
         lvN5G1ptPirqDO85jdOp47BWA9MJm/z4Kcuzuh6yVL2pnLpcF/Uw4mERq/Siv1vZ2eMQ
         WGKJAkQHqeDReRN5me9rxTKini4wIOwCZjirxG0wunRnpyvqVfZs1EDQzXiZjCK8xLxA
         VFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691655558; x=1692260358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78OX4fId0Em709uz0mp6uxgk8bb4IwlDXBz/uTj2fjY=;
        b=UweizZmdK1TgNsczjSeSn0YcTyBaDY0EeNVVnZvbW+l9+RlcH58jsiuTymIXeJYzFn
         Khseki8RB6bFHGYVUDo7n9Ddr57RckqGrCBqlypDhTCnzXSO/HUUGZg3Zo+xvPHr/0pk
         anTsNkMrD78h2Ut5E0zt7zYP46U9t5ZbDFKTpQUSO2obTy1h+wM5p2yCjaeOZ3IxAHeB
         Bjyb+JJvJBEg9fRX4T6N3Bkv1ipy/7R4sUmToMxg2fKXx5G5/ztRH2AtqUlBUIIVyjQG
         YDBYjUp7am+tKJZbZerdj8r0AOo3lTEcOLmfJHXyfWsNYpq3UPgHHvKrkwP4eYGbStzU
         oPQw==
X-Gm-Message-State: AOJu0Yxjm/u0ewqy4lia7wfFgf8b1a5p7wGwl7Apa9VrvRjS2ZlQ4EM6
	U2L3EAtzGtMSXp5SavJhUafbBmdBLBqJz+2JFgwBIA==
X-Google-Smtp-Source: AGHT+IG5aWoH89NQGXx33HlD2q+rxamc3JsaObqeeE5H8gH+u446bjvEEFYnXEHJg1VQn5y6v1yXRNGsOkfTWSlQZaU=
X-Received: by 2002:a25:d711:0:b0:d1a:b59c:502d with SMTP id
 o17-20020a25d711000000b00d1ab59c502dmr1894292ybg.18.1691655558135; Thu, 10
 Aug 2023 01:19:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org> <20230803-dt-header-cleanups-for-soc-v2-13-d8de2cc88bff@kernel.org>
In-Reply-To: <20230803-dt-header-cleanups-for-soc-v2-13-d8de2cc88bff@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 10 Aug 2023 10:19:07 +0200
Message-ID: <CACRpkdYsdKCrQpfoXZFv1XqT-o1skX=TDY-WJ1CSpgavMb+UrQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/23] ARM: versatile: Drop unused includes
To: Rob Herring <robh@kernel.org>
Cc: soc@kernel.org, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <atenart@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, Jean-Marie Verdun <verdun@hpe.com>, 
	Nick Hawkins <nick.hawkins@hpe.com>, Lubomir Rintel <lkundrak@v3.sk>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
	Shiraz Has him <shiraz.linux.kernel@gmail.com>, Stuart Yoder <stuyoder@gmail.com>, 
	Laurentiu Tudor <laurentiu.tudor@nxp.com>, Jay Fang <f.fangjian@huawei.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Michal Simek <michal.simek@amd.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Li Yang <leoyang.li@nxp.com>, 
	Qiang Zhao <qiang.zhao@nxp.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 4, 2023 at 12:43=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:

> Several includes are not needed, so drop them.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
