Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8213A8E9
	for <linux-sunxi@lists.linux.dev>; Fri, 15 Dec 2023 15:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="laQP4asv"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3364b049467so658803f8f.1
        for <linux-sunxi@lists.linux.dev>; Fri, 15 Dec 2023 07:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702653554; x=1703258354; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMReaTbQ3mhpSM37nBgg+G+dvqzrCE9o1IcxtKQzbVA=;
        b=laQP4asveCLABQCJDibL1McPk4IyyZ4Kz622N8pwq3quvzYRwY+W7yytLPKcODBjkG
         +R7kva0LI1uX+3W7BE4KvV2tbU+rb85p7fSrMECDTE5k9sroWMZH9Sy3/e9MWqHnHtyb
         FgdEClseH1+pzjC5B2e56zSzObYKQClyl49KG4215njpXef76ZgHwBBpvXur/dSETpUH
         SgpmvmxxCok5kHSw3RZn8G/OeE+1JRLkOT6Tk4lvj4VqwYQ7OMlkuqbYkPCOBawkcXuk
         pVHsOn+33W9C1sIkIFGSI7Uk6H+aIzYYgim8UGTzYiCYHXcApvIPDatEyNw81HTZsmWd
         848g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702653554; x=1703258354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TMReaTbQ3mhpSM37nBgg+G+dvqzrCE9o1IcxtKQzbVA=;
        b=OybvachCF+sIl2sk7TUlBA46oY6FmL0Ei9FoemYzXd2vGCf+uJsABg/cqRCfKJzTEl
         2CQcheb4x3IkQ4V2nIW2nrlz0f4tYGTxIE6JR5QmRkvXX5Zzsp/eW5D6SgK6W108FcFi
         XOrz7KqjczWy5t76M0EK0/PZXNAaQ3uzk6GnqCtuuabSKekzu85m9BVxRttV71GbtUXq
         4t3nGdhKQDRbQ/CNYXFokyTiu6Wgb0cMh+sxTSd87RU+bOG6X8r3EwMExaw9JyVZrwoh
         urHxw5Xft09/9iGpdJzWtAuVhxHL701hEJ/CYDl1DdcSCcSGmzF7p3zvU10Nki48rluD
         iACw==
X-Gm-Message-State: AOJu0Yxr5h72gwFXMZsHjYbvD8tRk7XNRaF53yn/zl4F9SeIx7A/mTNJ
	m4fzwtAi3zVZnqaRzQcKo00=
X-Google-Smtp-Source: AGHT+IGKqTqBRSWdn71ojaWth20HbPUm9gy+BpxlK4y7dtRj5sPpy5aey1MFNTP111CfVFovxNGCrQ==
X-Received: by 2002:a5d:4573:0:b0:336:595d:d201 with SMTP id a19-20020a5d4573000000b00336595dd201mr291256wrc.19.1702653554178;
        Fri, 15 Dec 2023 07:19:14 -0800 (PST)
Received: from localhost.localdomain ([154.72.162.212])
        by smtp.gmail.com with ESMTPSA id r8-20020a056000014800b003364360839esm5891186wrx.81.2023.12.15.07.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 07:19:13 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: jernej.skrabec@gmail.com
Cc: aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	fusibrandon13@gmail.com,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	rafael@kernel.org,
	robh+dt@kernel.org,
	samuel@sholland.org,
	tiny.windzz@gmail.com,
	viresh.kumar@linaro.org,
	wens@csie.org
Subject: Re: [PATCH 1/5] riscv: dts: allwinner: Update opp table to allow CPU frequency scaling
Date: Fri, 15 Dec 2023 16:18:35 +0100
Message-Id: <20231215151835.46492-1-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <2177637.Mh6RI2rZIc@archlinux>
References: <2177637.Mh6RI2rZIc@archlinux>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Dec 14, 2023 at 5:37 PM Jernej Škrabec <jernej.skrabec@gmail.com> wrote:
>
> On Thursday, December 14, 2023 2:47:14 PM CET Conor Dooley wrote:
> > On Thu, Dec 14, 2023 at 04:44:46PM +0530, Viresh Kumar wrote:
> > > On 14-12-23, 11:33, Brandon Cheo Fusi wrote:
> > > > Two OPPs are currently defined for the D1/D1s; one at 408MHz and
> > > > another at 1.08GHz. Switching between these can be done with the
> > > > "sun50i-cpufreq-nvmem" driver. This patch populates the opp table
> > > > appropriately, with inspiration from
> > > > https://github.com/Tina-Linux/linux-5.4/blob/master/arch/riscv/boot/dts/sunxi/sun20iw1p1.dtsi
> > > >
> > > > The supply voltages are PWM-controlled, but support for that IP
> > > > is still in the works. So stick to a fixed 0.9V vdd-cpu supply,
> > > > which seems to be the default on most D1 boards.
> > > >
> > > > Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
> > > > ---
> > > >  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 18 +++++++++++++++---
> > > >  1 file changed, 15 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> > > > index 64c3c2e6c..e211fe4c7 100644
> > > > --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> > > > +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> > > > @@ -39,16 +39,22 @@ cpu0_intc: interrupt-controller {
> > > >   };
> > > >
> > > >   opp_table_cpu: opp-table-cpu {
> > > > -         compatible = "operating-points-v2";
> > > > +         compatible = "allwinner,sun20i-d1-operating-points",
> > >
> > > I don't think you should add a new compatible for every SoC that needs
> > > to be supported by a DT bindings and cpufreq driver. Maybe you should
> > > just reuse "allwinner,sun50i-h6-operating-points" and it will work
> > > fine for you ?
> > >
> > > Rob ?
> >
> > The driver can definitely just reuse sun50i-h6, but the binding and
> > devicetree should have a soc-specific compatible for the sun20i-d1.
>
> Correct. This is to avoid later regrets if it turns out there are some slight
> differences or additional functionality.
>
> Best regards,
> Jernej
>
> >
> > That said, the compatible does need to be documented, there's a
> > dt-bindings patch missing from this series.
> >
> > Cheers,
> > Conor.
>
>
>
>

This dt-bindings patch will be available in v2

Thanks for reviewing.
Brandon.
