Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C64F3CFF6C
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Jul 2026 09:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782983797; cv=none; b=kEguN+9JjSuu/P7iqu23QIDNDoqRDvFCs9/R3QtcibNnOdRfN0pXTc2/c2hsaotQqJxDGTiyfH6TTtWvcmCpXGD3bXRMZDhW5OtHzzQCPfAG9aJVY62mZxQ/goklOxvo2EzF0yi8b/amPP41oiabuRfyMCdh70fk+MB0NyNklQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782983797; c=relaxed/simple;
	bh=n9yLVv4ONKzRdpCf8VFwTS/MdDc1G1FjImPOjJ/IqKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RQcjvDKxI3KSX07clkmvqeurZsr2KL3WflR4emrUMcy4FTGnlh/k+INAmNApf4zNi5UZU+FpJSbgzPNAcSjhPPt0LogV9AlcSdmYfa5s5n2ONvKce0OoLBQmJxvyKs87deZ8vCCfh9zIAPVvvHfKW7Rglxa16z3dpJeARractFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-966d4748ad5so982497241.3
        for <linux-sunxi@lists.linux.dev>; Thu, 02 Jul 2026 02:16:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782983794; x=1783588594;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3iqz34neGUxAgVEYrpwzzcpe57aRQt9k5cgKzpkuWc=;
        b=cQtnP8TmKbGTTiepT04t8VkPjROy1lajT69/3BxQmcmCws9m0QoK2BlRaAC9hV3alD
         dCsJVvJVr9e929fhBl9GZ0X9pPVsFIuTsDennQGl9W/O8WE+BSHd+1QSI2YOKOp8evLD
         Ug/2l387AiUSCjKuLH/xrAT87npS8Y1BH8H4B02cP7ka1SZip4CsQM5Ig/BWT/XRoxQ3
         KTuNnuW2+V1gf9zQtEmYutwx86G374o0AUQlUfHr4/nPlA0VuMqXMYQMEyLtbvfUh0NX
         NcUyLLYkiqZwf8aPHCwqqwzXTHYwv3OLMmoW1j2OtHHohQDyARj8w0WA/EMTO5Z0OBfw
         0IcA==
X-Forwarded-Encrypted: i=1; AHgh+RoPJ6CgaP7OHDUwIWgJ8VgLbtrjxxIregMpxADcoO03QJ/YOgbrlxZhLKfZl9foYElvYK84JSGiu6TK9g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxxkkBgHXyMR404Pziict+2P+CcZ3y3Wrbgf1IboUb/CEtOWR/A
	ShtUGI/jChvVKVk/sVNxuGwT72irvQWLpqKe/+7Ww5hH4ulmkDL1nPllOl3jFBgxgJE=
X-Gm-Gg: AfdE7cm3c8o4k/sFPUWISqkDPU3MBouby1AQ5V0cTAMzur4uFVxia0NWSmbnjcxR8X+
	oZWEWSSUOflS8l2fst58Cpgx0h3asR9e8+ufOlme0CxR0MLytadwkZroACRt39uhdCZ/J5Y4Pw2
	qPRgBmy0UhchQfB6svSz1K8EwgkRs4CLfuPI2OIzNUTz6jqjfYQ7QMZP8S6emnSMhhpvmkRLTZy
	qqXnBkuPe3xziIXL7JqkMlKWZCMcn524hLc+ETPcTckkxfElrJWXDaOURMhgrZDMpcpAvc12mdq
	mXEbHt5rCs1v1kxVrhgjiNuyUXx2AMvw5OitHPVhg+u6l0dl4kLeQdzJHOoVHwxnueoDi6k5vC9
	xJcMQyn7KA2f8hTIUQx6O/FAryqbODTXH5TOnNGHo1lAGsLUJo1MGvzZydsY/iSZs3DW3ydC5sx
	ilNo4l3x/h9Kad7Lg7Vs2/83cFHab4J98IjECp22mJ+0dpU+yMcQ==
X-Received: by 2002:a05:6102:800c:b0:738:40ba:bcbf with SMTP id ada2fe7eead31-73daa351485mr2287556137.29.1782983794166;
        Thu, 02 Jul 2026 02:16:34 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-73e1a4495cesm1080718137.5.2026.07.02.02.16.33
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:16:33 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9693bd72129so992934241.1
        for <linux-sunxi@lists.linux.dev>; Thu, 02 Jul 2026 02:16:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrmJe9sv2/SYQef/Y6HQ6jJFSYWMH/wPbVjW1ClhmzDpsG3NgubUaHoX+reKbvD6KY4BhIPLOX7E1PwNQ==@lists.linux.dev
X-Received: by 2002:a05:6102:1620:b0:62f:46be:8318 with SMTP id
 ada2fe7eead31-73da7681403mr2525301137.6.1782983793184; Thu, 02 Jul 2026
 02:16:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
 <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
 <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
 <akOZFIowVvprnAMf@vaman> <CAMRc=MfBcOhbj=ETxy2Xz9o_nyzykrEhKAc3jYi6V5_jMZEE3Q@mail.gmail.com>
In-Reply-To: <CAMRc=MfBcOhbj=ETxy2Xz9o_nyzykrEhKAc3jYi6V5_jMZEE3Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Jul 2026 11:16:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXNG=C=XcioQUEN1M7cQgKhO0AxUyg5X+TWb2rQ3-H3fw@mail.gmail.com>
X-Gm-Features: AVVi8Cef5-UyxrfN1fWvFDcXcIwIbwhU7f5lsircbKpxY8MZwCT2oXalNKmt_xQ
Message-ID: <CAMuHMdXNG=C=XcioQUEN1M7cQgKhO0AxUyg5X+TWb2rQ3-H3fw@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Radu Rendec <rrendec@redhat.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Thu, 2 Jul 2026 at 11:12, Bartosz Golaszewski <brgl@kernel.org> wrote:
> On Tue, 30 Jun 2026 12:23:16 +0200, Vinod Koul <vkoul@kernel.org> said:
> > On 29-06-26, 16:51, Geert Uytterhoeven wrote:
> >> > Russell King asked me to put the PHY logic for SCMI pm domains into the PHY
> >> > driver instead of the MAC driver where it was previously. Instead of cramming
> >> > both HLOS and firmware handling into the same driver, I figured it makes more
> >> > sense to have a dedicated, cleaner driver as the two share very little code (if
> >> > any).
> >>
> >> I think you are mixing up DT bindings and driver implementation?
> >
> > Should the bindings change if we have different driver and firmware
> > implementations? Isn't binding supposed to be agnostic of
> > implementations..?
>
> I've thought about it some more and I believe this question is philosophical in
> nature.
>
> sa8775p and sa8255p are *the same* hardware. I can flash different firmware on
> the same Lemans Ride board and it becomes one or the other. Yet they are not
> described by the same DTS and the bindings differ as well. I don't see why we
> wouldn't allow the same approach for the this PHY.
>
> We treat it as different HW variant when it's managed by firmware - just like
> we do with the rest of the SoC.

DT describes hardware, not software policy.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
