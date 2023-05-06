Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECB310F2
	for <linux-sunxi@lists.linux.dev>; Sat,  6 May 2023 23:34:38 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so38048612a12.1
        for <linux-sunxi@lists.linux.dev>; Sat, 06 May 2023 16:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683416076; x=1686008076;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d9CMRNtxtAY+iVGmS9Nhh6aBEK5BkbQct2dEiCYBRLY=;
        b=REqdkMLCTy5UbebEqan+d2erjtQW+iSjh884sXj1Iqi4KYxB131TlOq+KW3UENuDWX
         THEXQaq1WHPMypuFmc4Ml820f1CQcnJiRhg6tIzULFl0U7XUdt/BtJkTqvBlwVHTKmZo
         RrSbBWgY5Z/a+YK/iUZyJUaxTyRDa7mKvcJHTFETzU4XSaLZ732eP3d9cicNn1c/FHPN
         C+JXs5T4yrUw/3HFnYtgw6Wf5giKRXIvUIVVXxDtuo2MW2/ES9apApq6gqqD8xswEo9j
         zbpg1K+6pf1+scu4m7KByOUFr/PIsJColgxbgMqpEgGBOkmBp8U6eoMr4U4Ufiv3pJG6
         9psA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683416076; x=1686008076;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9CMRNtxtAY+iVGmS9Nhh6aBEK5BkbQct2dEiCYBRLY=;
        b=UKTG8wz2kB9NjIyRTJ04/qKwzgWFmyw8y5x68rdttbV8CjNrsEbsFl6ZOqXD4+IGEZ
         YfGmm770ZHjb2uZ2ChaCrxcFLJ3kLKmmi7+TseNPo6PBlcfPwsl6Y393+sSxj4NZnwUr
         tTNYhms5TRJY30bRQtzB56V7cQcxgMSHITw8QFDleMUo/dUcNjrITH37DN5pt071rvZz
         hk2+BUW5USJscGU5VMkcJaTwIotI9n/8GLW5HydpRUkEYRj6pXaN9Ptikq9SNdfuawtG
         nToBn6TMrKHiHiWXOT0y2j7RRBHrw+avwcIfaiV//2AdO4Hx1o6LbfSJxNxisx7jgF0/
         vUuQ==
X-Gm-Message-State: AC+VfDzQF+4Mv1igzjMSsutKz3aZe2GmLOTjPAvI1rDgoCMhpGdZ1kCS
	AONdpm330D9vlBZdpwpuq1SX9RGW7iED7p9+zxA=
X-Google-Smtp-Source: ACHHUZ5pLbXef8h/yugyYWaRiTv4z9p+9JV6clL+Ey23A/L6IzrVNYFXYzqgEhKueJGdu7i1soJsP6surAam4+MVHnM=
X-Received: by 2002:a17:906:6a03:b0:933:4d47:55b7 with SMTP id
 qw3-20020a1709066a0300b009334d4755b7mr4790270ejc.2.1683416076334; Sat, 06 May
 2023 16:34:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230506073018.1411583-1-bigunclemax@gmail.com>
 <20230506073018.1411583-4-bigunclemax@gmail.com> <20230506225848.3278d7ab@slackpad.lan>
In-Reply-To: <20230506225848.3278d7ab@slackpad.lan>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Sun, 7 May 2023 02:34:24 +0300
Message-ID: <CALHCpMg31VLy7=epEs4LTpUcWT+gLDJ-9bWGJMgYrTP1ozOX_w@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] spi: sun6i: add quirk for in-controller clock divider
To: Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Maxime Ripard <mripard@kernel.org>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> Don't we need to set tfr->effective_speed_hz to the actually programmed
> clock rate here?

Yes, we should. Also we need to configure SPI sample mode by setting
SDM and SDC bits in the SPI_TCR register.

Please check a new version of this patch.
https://lore.kernel.org/linux-arm-kernel/20230506232616.1792109-5-bigunclemax@gmail.com/
