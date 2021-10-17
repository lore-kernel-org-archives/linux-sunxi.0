Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8C272
	for <linux-sunxi@lists.linux.dev>; Sun, 17 Oct 2021 10:13:11 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 367074005C
	for <linux-sunxi@lists.linux.dev>; Sun, 17 Oct 2021 10:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1634465018;
	bh=/w7rnLVxUNTURGieCGfqqQ4bUB62VIx19Vc4b3uH07U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Syw6PWxsIVg+9BACtbHhY5TDfantVSxI0kxK5HdqsqcaGMp7pF41vluGvmCvwlb65
	 5m8ARYmZCf1ed+3HMcwUzLkq3y5pDfH3qyxEJZHjonblt4LB7ZRQhpIRPISzW/6AnP
	 hJm2tG9cGfVqUZu9ZGcdtj0ly47Rx6xtZm4B9+2IVVQdvjMb7l1X8bqr5Wt+xqYNUx
	 pNvskuFcuQWVHtRONNK+zA/qgSopQ0G4m7/oc3EAOepruh7fkKs66R7ywbpfmCjIsL
	 5jHx9HrhCJAnbj/0h4IauikaMhErQwSIhjYuWGnrQuJUnoP6O60MYTgYaSl+qJTJE0
	 O2KCgEpHdbmwQ==
Received: by mail-ed1-f69.google.com with SMTP id t28-20020a508d5c000000b003dad7fc5caeso11763851edt.11
        for <linux-sunxi@lists.linux.dev>; Sun, 17 Oct 2021 03:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/w7rnLVxUNTURGieCGfqqQ4bUB62VIx19Vc4b3uH07U=;
        b=nEM9dqNZfHXVHuE2aZUkakLhhoEUWQUUAgLUDR8p4KLO9aWOkcCmEtALaT76hig0m/
         0Y7Fh+gy34aijU/SmoaFQaPk/L7k6o3dGMzDDpxt1+IIhZvZf255XPRDC6tAInGlFt9C
         wRCdRzL1WaWrMrkzZC4rsdlEQQiQ7G524GjxlJexaCLNywnxf+n6yZA8dZ2KlN4myuGO
         8ulDM+9CS5iHMsw6nfLoxsOK/zkVxkKyL3XCtyeRNWS6AFdbpZf+4sUOqeRb84FmAQow
         Sk9rTF5iw63xrW9ZpYQTBTArteA+nWf+v8RpXR/IFY68VoYyM0iZZXgfua43LNmi1IhG
         ilHA==
X-Gm-Message-State: AOAM532cZpP6exTq1QJk8Tl+FM+VJYl7KOCgu0/VNxvDN0PaSa6+z4Ac
	+rll9TdIcCnCiCAwvIBFb4JNMA0YFpcGZ1rYQzhUbnN2CDk70dzxKYWaCN+ymCNIeCRmFOkFOp8
	87SU0Gnbn3F+TMwDEhFSoAMdPRy5vL0vcC6m+wRD+O2Rymv2gAZH+btUv
X-Received: by 2002:a17:906:919:: with SMTP id i25mr21077544ejd.171.1634465017812;
        Sun, 17 Oct 2021 03:03:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBD4IVI+3m1jDS1GLi//iCI68rTkdNzvWdP8PXY93uSfBu2PzfjILpnco+k3Rb/r6y11YH8kKxYU50YYZPaHc=
X-Received: by 2002:a17:906:919:: with SMTP id i25mr21077516ejd.171.1634465017650;
 Sun, 17 Oct 2021 03:03:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211016102025.23346-1-arnaud.ferraris@collabora.com>
In-Reply-To: <20211016102025.23346-1-arnaud.ferraris@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Date: Sun, 17 Oct 2021 12:03:26 +0200
Message-ID: <CA+Eumj5zqbk7Vn7dAvjNWXKK6pCNgu34-VZGudP=BmO0_+0Tgw@mail.gmail.com>
Subject: Re: [PATCH 0/4] arm64: dts: add 'chassis-type' property
To: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-rockchip@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Martin Kepplinger <martink@posteo.de>, Heiko Stuebner <heiko@sntech.de>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>, Lucas Stach <dev@lynxeye.de>, 
	Angus Ainslie <angus@akkea.ca>, Guido Gunther <agx@sigxcpu.org>, Tomasz Figa <tfiga@chromium.org>, 
	Johan Jonker <jbx6244@gmail.com>, Eddie Cai <eddie.cai.linux@gmail.com>, 
	Shunqian Zheng <zhengsq@rock-chips.com>, Brian Norris <briannorris@chromium.org>, 
	Dan Johansen <strit@manjaro.org>, Simon South <simon@simonsouth.net>, 
	Matthias Brugger <mbrugger@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 16 Oct 2021 at 12:20, Arnaud Ferraris
<arnaud.ferraris@collabora.com> wrote:
>
> Hello,
>
> A new root node property named 'chassis-type' has recently been approved
> added to the device tree specification[1]. This will allow userspace to
> easily detect the device form factor on DT-based devices, and act
> accordingly.
>
> This patchset fills in this property for existing ARM64 consumer
> devices (laptops, phones, tablets...).
>
> [1] https://github.com/devicetree-org/devicetree-specification/blob/main/source/chapter3-devicenodes.rst#root-node
>

I'll add the same for Exynos, S3C and S5P. Do you know by any chance
what is the meaning of "embedded"? How a development board should be
classified?


Best regards,
Krzysztof
