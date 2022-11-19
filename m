Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91088364
	for <linux-sunxi@lists.linux.dev>; Sat, 19 Nov 2022 06:37:56 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1322d768ba7so8445553fac.5
        for <linux-sunxi@lists.linux.dev>; Fri, 18 Nov 2022 22:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cLYrlsSUJ/3iV70MlNgEm3O6sI1BB8dOzm7Fo6KqsgM=;
        b=cNFOo+VqMgo+mnOiJFXxMwMeFQLoitwcWJzIOOFWlhDZn66wiP2M4eBUI7NktrM1uC
         yaoxkbPYDfgg1iDxd9fZ4xi9O867toY85OU0FO1wgrIcYtErgNqSkIaDFS1yLEWy06Ze
         Nw1/AIkSKmJKMc018JElW0dxYRL+GkqGyoV263phPIjoXOrycZ0f4UAzEZVysgHM2sCC
         u3DTAZg7k0XUYqkROhzjmjl20OPHdLpF2N4VWXL/gTSjK7lRgBotEJdsiOLa4wIH6cX7
         RdwHdpMT7MwsU0JqQ6wxuSX6BvrKyH1TcIs0CmWyKM61aIq78ZXPr1jlmFDGDcT3Hvct
         8DkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cLYrlsSUJ/3iV70MlNgEm3O6sI1BB8dOzm7Fo6KqsgM=;
        b=lEg065yrYe6+Y9IQ1k069NhjutMmkzRlt+h0fsiVFqNzOL40enEolRXDd2ZXEvEGz5
         xWOUXSTfMxmSsiHgcE4soFymS/KHx3f91jEXC+2NpGkHgsTaA3ciozqIvyj6OyaDHQFH
         n3D+LhIaiNZo76J0nr9elHglaYnzItKusEG8PBpwaPDjg1Th5VD0J3+By752ZnZ6dE01
         uWuyA/F7SfUeLzMugqcm2i58J3MsdoIuvcagbQUFvVHbcXvjqfpIseqVjKoTmnMhBUNK
         wWRVVooE5IBOrGLg96PX1+dSAfW4LrHW6tst05PWDg9Wn572nBW4DAeDzykxKp3y8BAm
         5dOg==
X-Gm-Message-State: ANoB5plR3w1nzKpq5MWORRAy18CzQPhFCTLbUPQ4w7rAu0jisC8yUN96
	Mg3ycdbeGJK7yk7K8oyiROAHzgeSEE9/YubAsUw=
X-Google-Smtp-Source: AA0mqf4YHBgpQyRnlsR8IJwpaWfoiK6RVHKjHFNz8PNwpwXg9+N4cVuAs+273DwuP7yKjh9Nyq4wN2dl85vztU/s7dM=
X-Received: by 2002:a05:6870:9591:b0:13a:eee0:b499 with SMTP id
 k17-20020a056870959100b0013aeee0b499mr378364oao.83.1668839875548; Fri, 18 Nov
 2022 22:37:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221118223728.1721589-1-robh@kernel.org>
In-Reply-To: <20221118223728.1721589-1-robh@kernel.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sat, 19 Nov 2022 07:37:43 +0100
Message-ID: <CAMhs-H99X9aV7cdotCPar6g50KXL+qNS+jM16Tveq9nxfUY4Rg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Add missing start and/or end of line regex anchors
To: Rob Herring <robh@kernel.org>
Cc: Ilia Lin <ilia.lin@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Yangtao Li <tiny.windzz@gmail.com>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Marek Vasut <marek.vasut+renesas@gmail.com>, 
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

On Fri, Nov 18, 2022 at 11:38 PM Rob Herring <robh@kernel.org> wrote:
>
> json-schema patterns by default will match anywhere in a string, so
> typically we want at least the start or end anchored. Fix the obvious
> cases where the anchors were forgotten.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/pci/mediatek,mt7621-pcie.yaml         | 2 +-

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos
