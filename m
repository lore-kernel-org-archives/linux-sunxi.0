Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6881FA0
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Mar 2023 05:50:02 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id d22-20020a9d5e16000000b0069b5252ced7so7951701oti.13
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Mar 2023 22:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679377801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQRYTyJUcXjGIlb32K69CN7N/CfuacDHmOLvuVVkIeU=;
        b=F5so8U9eSPDfKwLwdhjWe1tE8PfeVDHKjkiyKaVpWQqKRuyuavEeTzXd4hk6L3z6zp
         VHPO8QjxcIT4MYzTcNnHQK4kCkDGjZgPowyHLuCLV9GljdqpK9u99uNfqkBMK5RA93gv
         FGjbjWg9KVC+SGloN3ekhh+2k6L7EF7wthr0pjQIqJLNck01caZneaWdLgqxokr/RLrO
         1sgViMnoTTZxc9T5zi936whRCWGOMENT2d8QDQSNUknsMhStPJdQFhKuw7YCDQdWuHuY
         XA7Htk2YAl4jH1GHMq/ggeJA09GTqzjWLySHNgMO09vanozHHeos4pEKMn6CfOVlZGDt
         TxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679377801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PQRYTyJUcXjGIlb32K69CN7N/CfuacDHmOLvuVVkIeU=;
        b=fs610GyQT2/a055USAreDIUB5FXymfvGU6R24rwtA8tFoZH3XLE7Gk6yvhzofld/aZ
         d2vbB8YWG+F8y0Roc1+uBC1zLC7usSyhIC3IweZ8RjFfJeBaZS8hDQBTPrxvbwlqT/VA
         DjkMVRQVVVBx5jFYc9rYBFPQtnSNwoEl2JYZ5qVChxn24Lp5XBGxogmWHuacWEFTnCcP
         TSqw9n/w8ewOwnWVtmhNIF8HyomBkMgfL426I5lI1ZSP1YfJKcRzTBfHuokZIM4ZMHCY
         JEirW98sHx2qedczb6PwSxZUq9BqHHmlOpp17hU/NzXrlyKOb+8NuZtTQNnCmVH4REyP
         cWtw==
X-Gm-Message-State: AO0yUKWgbEUCnZeAXpLU2o4YoyueFK/NkCaTu4DUQhr/WdLPhmoposRW
	xaiqwJhI1mphioraghV4M4StpfAu+B4K/cR6tGw=
X-Google-Smtp-Source: AK7set9hGdm8jb3Zms52xIkHW02ezlDplA4s1W/5C+8w1fxRVUiCGMOX1ghjWbWe1rulG24xEDF5Rs78eQG2Vsd6oW8=
X-Received: by 2002:a05:6830:13d3:b0:69e:24a7:e042 with SMTP id
 e19-20020a05683013d300b0069e24a7e042mr409968otq.3.1679377801763; Mon, 20 Mar
 2023 22:50:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230320233955.2921179-1-robh@kernel.org>
In-Reply-To: <20230320233955.2921179-1-robh@kernel.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 21 Mar 2023 06:49:49 +0100
Message-ID: <CAMhs-H829e-QSwMXAVN6b4pYTB+_d-PLJxbEqdhd9oOrYnY-aQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: phy: Drop unneeded quotes
To: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Yu Chen <chenyu56@huawei.com>, 
	Binghui Wang <wangbinghui@hisilicon.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Robert Marko <robert.marko@sartura.hr>, 
	Luka Perkov <luka.perkov@sartura.hr>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Vincent Shih <vincent.sunplus@gmail.com>, Wolfgang Grandegger <wg@grandegger.com>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-can@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2023 at 12:40=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

>  .../devicetree/bindings/phy/mediatek,mt7621-pci-phy.yaml    | 4 ++--

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
