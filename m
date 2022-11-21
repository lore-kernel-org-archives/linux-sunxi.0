Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6337F5
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Nov 2022 08:38:06 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id h24so6836472qta.9
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Nov 2022 00:38:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=majJ1avGrA5sKHgff1+tjzzyZx4Q8F2N6bTI30UoVN0=;
        b=cyH4U/kOIS1DpqrT9xYiiHjNLF09OyP/5JBTm445eLvSlKeXt3DM1ASk7u/NPpMZmT
         gk/HRXtSSoU/QJdddjBaQtLNUiIwC7B5S0WN8vF1osxl/rV6fiVcl+eBSIDsE3bkqiQN
         inrEcclz8mJhxsm2bhj0k78fZvPZ0vq6U7pSeab2LtwZ82kdKG56jNnBJde71ZxzB2ID
         OeFAxzolCNqBJHCtHIXVsfvx5hrDfqhLBqYOICMTF9QUtzRgoQiq7eybsZ//gCtcaYv/
         JVUScrASnOKb3ldz65i5uMzQrXj80VXjKNbKzFPZaO/dyyAcsgVHH3rveiDvSRrWBrf3
         A4fg==
X-Gm-Message-State: ANoB5pmV2Bfi9vc6Ggzlmfbt6gtNK3AdTEe3b7D0FmiusnJa74nkp+/M
	QYtTeNQz3N3TPT3hResQCB6VEz4sLssT+A==
X-Google-Smtp-Source: AA0mqf7h3/ubM6dRGIGLvVGbrx4MhCSIe2fhUCTdhn+Dd+URlK/K8P43wT9OL+xkYArsNocEx9YFJw==
X-Received: by 2002:a05:622a:1a03:b0:3a6:2a70:bc57 with SMTP id f3-20020a05622a1a0300b003a62a70bc57mr12142305qtb.75.1669019884871;
        Mon, 21 Nov 2022 00:38:04 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id r13-20020ac8794d000000b0039cc82a319asm6288239qtt.76.2022.11.21.00.38.02
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 00:38:03 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id b131so12752467yba.11
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Nov 2022 00:38:02 -0800 (PST)
X-Received: by 2002:a5b:24b:0:b0:6ca:3b11:8d76 with SMTP id
 g11-20020a5b024b000000b006ca3b118d76mr16184146ybp.202.1669019882500; Mon, 21
 Nov 2022 00:38:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221118223728.1721589-1-robh@kernel.org>
In-Reply-To: <20221118223728.1721589-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Nov 2022 09:37:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXevKD5uq9k+gWygy0rZ_AVjxBW1vrE_Gzzu8=mJu1vjQ@mail.gmail.com>
Message-ID: <CAMuHMdXevKD5uq9k+gWygy0rZ_AVjxBW1vrE_Gzzu8=mJu1vjQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Add missing start and/or end of line regex anchors
To: Rob Herring <robh@kernel.org>
Cc: Ilia Lin <ilia.lin@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Yangtao Li <tiny.windzz@gmail.com>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Javier Martinez Canillas <javier@dowhile0.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Maxime Ripard <mripard@kernel.org>, Daniel Mack <zonque@gmail.com>, 
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	alsa-devel@alsa-project.org, linux-spi@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 18, 2022 at 11:43 PM Rob Herring <robh@kernel.org> wrote:
> json-schema patterns by default will match anywhere in a string, so
> typically we want at least the start or end anchored. Fix the obvious
> cases where the anchors were forgotten.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

>  .../devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml        | 2 +-
>  Documentation/devicetree/bindings/sound/renesas,rsnd.yaml     | 2 +-

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
