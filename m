Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B307C
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Mar 2023 21:17:07 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id n125so10861742ybg.7
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Mar 2023 14:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679260626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umIKUZ29cWxRGLpplScGRMR85hsAlE3Adfx/LlasVhM=;
        b=odOHan5KodgnZmQYP5bE+Zx5oWuObSka+JlAj9+I+PEuls9mRUte5Fd1E9WehPEH0v
         ZEUouTX/UvXXQBiT/SNrO1n/f3o+kSQlfaYmdNK4DAR8Ejqf2fhzotkFgCdRQtcs1CVC
         t5VLMfDqC+6dzZCRc67iIWhzpcy/Pk8gir+iKkECVK6wCNHZH2ZDuC5lvdh7tZq5DQuj
         ObQBbb4TSLQVxE7XBRQy+d8Lbb9XjTL/2eJtfomhereizk9tghsCcrHhrXpWlcA+TL2p
         v61FtSAq1/yzKQz5Qm+nbB//3YVMqfY7U/pGKdm4qJTu9FwuezpIoi2MADQXjrLIWQlB
         6CZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679260626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=umIKUZ29cWxRGLpplScGRMR85hsAlE3Adfx/LlasVhM=;
        b=YKBRYaHAhMSeRBHASuhNaVGAPsKN8I0aaPfxTWurJUNYNX56svant2J4EDzobWDkWs
         7vScI8yzFubJVWg2G8au4PTAFP/213GP/M8bsKj6Z3Nhp1aq5mqyjtVaengXxqEzstaU
         X59S6RWirHWapXIkla01y5aKYaXY0wlfnQNJwv/eJhE2AZ8SdyKpGDt5VZZadL56DKbl
         wXDElUaZNFiB8hxPAaaH1N6ypuj1qpM1GX1kvASqvT3VBUr2K6Ux+hnB/4DXDhII+gqs
         DP/Z0Hdm6n3eP8kjwrx79m+wryblFxoHR2XTnmjcIaWqme0YdDFHM4MpkQz+XMSfjcBK
         1/yQ==
X-Gm-Message-State: AO0yUKVdA4TdrEs3E9euJhXC85fDrU50WKdBnd7neQgB9P3ByAzx5b2J
	PjVXdnU6TRoOnaqdtHdzvdkYELb/JknxESnPw4bfDw==
X-Google-Smtp-Source: AK7set9Y0TmDGARQ0tonQqRCQHdH+03X2NR6qq22FebqKohfKPMVp4wrMtKTGiLfsl0XoE3P/cG/TeF1FO39PIanZTY=
X-Received: by 2002:a05:6902:1143:b0:aa9:bd2e:3746 with SMTP id
 p3-20020a056902114300b00aa9bd2e3746mr2999493ybu.4.1679260626301; Sun, 19 Mar
 2023 14:17:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230317233631.3968509-1-robh@kernel.org>
In-Reply-To: <20230317233631.3968509-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 19 Mar 2023 22:16:55 +0100
Message-ID: <CACRpkdY0twhF1+ipbV0DuWUdeCyq09uZidyVSNr7eW=K6ecnkw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: Drop unneeded quotes
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Naga Sureshkumar Relli <nagasure@xilinx.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <michael@walle.cc>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 18, 2023 at 12:36=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:

> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
