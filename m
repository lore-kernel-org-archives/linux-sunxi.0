Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1007814EC78
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 18:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712946282; cv=none; b=DZMh7ODf65mD+vf+qpnznhWBESPHzf/pm8c+/oJAHMQ4l04YGhJDbkaJQQWbzbLuUb3AEPfeiRw0PMnACLoC1q8nXr4+JQze0TpZCwwqvHWw7zR6V5uOQBOSk5mVjm8AVbAo+oiQaNwcIjs9wLsq8IFFCuHd//gCOa6dil269zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712946282; c=relaxed/simple;
	bh=nY7gbkgkBr+eHZR919YowyRoq31FRxlbVFMFZulxFuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BAF9X3MA71INLu3aiz5Co2W2yZKDrvoisYoU/pMaYBPvck125DcH1JbomNRSj00r2z52Kdk38HvV8ACssHIrQxPMszrx1ZhSEH+fAdh0Y7fH3qPSHSCnrLVvxi1aV8oqqfCrDoY1tTFEKIc/tJjagySxiCTnHXgPvBAQsm/WZt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=fdiQSoar; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="fdiQSoar"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6ed20fb620fso981222b3a.2
        for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 11:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712946280; x=1713551080; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VnBuVioN4do9yO5Fp+To5ya+VzBTYCmZkVY34L3QmB0=;
        b=fdiQSoarQPdRN1FWH9Ipqnm5kmKQz/1Ok3jhDf6jaBkTCrlbNf4IrQ18bpiktTo/ps
         DvmG/zj2+4mAf0glCRzRIlsDvBXJ8FuB2zGzJ/L1X+Ijn0APHkNcwjFT8dqb9iKgcdHw
         EXifWtd/JAPmMZUFZ0iMLRdwo8LrESLKXxx8FDbiL56bm68w6CUNWrE7VSi6RsrKZW+0
         6sY1RLvlbYTu+Xc87XTb5f9r51MAvUt7SXnWKzje8PtGf93PkINvZ8srE1GDZohBjykq
         7BNHnzz8otjLosl3rLB+U6VODLJYnMnJLy2wSixJ3EUu1jTbboUb8cAuHu33zcgjmUqz
         N0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712946280; x=1713551080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnBuVioN4do9yO5Fp+To5ya+VzBTYCmZkVY34L3QmB0=;
        b=bWEgHmOK7MiHIv82PUQGYfoYr/zpvF3dM4NdjsR4/dgl627zoeQYpWQUcKJY/FBpd2
         U+fWEpIXsCJ+9xt9c0AABJchJofV2gOVPRIe54qU/Ph/s1i7p2fywcYxQqfk2UJjZY36
         +UEWxRN3OEXaAvb6QeB+aj9boTJIDEmUV68MrF5KnjG28TiQEYEDwKdi15BCxy41pICO
         rFEcRxyBdWNjLudaaeKuN/F6ByC/gz5Dm2DIdzliO2Omzx+Cig5d9c7VKxPo+1jDlWeD
         AhgSuwZNHtz3+0izzfyPBfRAlNc/V1sL3sKuhi0pQ/SSin8slLDZ5qYrf9lNkF9xy8kU
         8aYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKd06G5wh0urzH/NriZDMpjpY1SYnM8Xb3vC37tEf46DzM9A+/VXjnGINGjxfSg+gCOwhdMykb/B0v7Aph24X6CraIQMHwJ7b1MUY=
X-Gm-Message-State: AOJu0Ywob3j+LWveUKdjLhpA6TYBilRlt86wqln7vNJ3GfOatAMcC7in
	ZmB2uiz5J5IASxXw7owhoiIQ9SfhUIHifOov1u+OyYh4MJi0iVXKBoi6o60Smvs=
X-Google-Smtp-Source: AGHT+IGBSZ+NKU4CickCNnsQ+/kbxESLkfaeQqukqebjAC4cnyf8qidufBP0hWj5qMBvb+MfDt1C/A==
X-Received: by 2002:a05:6a00:3913:b0:6ea:8e89:7faf with SMTP id fh19-20020a056a00391300b006ea8e897fafmr4224014pfb.28.1712946280297;
        Fri, 12 Apr 2024 11:24:40 -0700 (PDT)
Received: from ghost (mobile-166-137-160-039.mycingular.net. [166.137.160.39])
        by smtp.gmail.com with ESMTPSA id q4-20020a656244000000b005dc4fc80b21sm2633420pgv.70.2024.04.12.11.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 11:24:39 -0700 (PDT)
Date: Fri, 12 Apr 2024 11:24:35 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 12/19] riscv: Create xtheadvector file
Message-ID: <Zhl8Y+GzTB/ip7rT@ghost>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-12-4af9815ec746@rivosinc.com>
 <20240412-thirty-sacrament-db052c7fe6fe@wendy>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412-thirty-sacrament-db052c7fe6fe@wendy>

On Fri, Apr 12, 2024 at 12:30:32PM +0100, Conor Dooley wrote:
> On Thu, Apr 11, 2024 at 09:11:18PM -0700, Charlie Jenkins wrote:
> > These definitions didn't fit anywhere nicely, so create a new file to
> > house various xtheadvector instruction encodings.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/xtheadvector.h | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/xtheadvector.h b/arch/riscv/include/asm/xtheadvector.h
> > new file mode 100644
> > index 000000000000..348263ea164c
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/xtheadvector.h
> > @@ -0,0 +1,25 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +
> > +/*
> > + * Vector 0.7.1 as used for example on T-Head Xuantie cores, uses an older
> > + * encoding for vsetvli (ta, ma vs. d1), so provide an instruction for
> > + * vsetvli	t4, x0, e8, m8, d1
> > + */
> > +#define THEAD_VSETVLI_T4X0E8M8D1	".long	0x00307ed7\n\t"
> > +#define THEAD_VSETVLI_X0X0E8M8D1	".long	0x00307057\n\t"
> > +
> > +/*
> > + * While in theory, the vector-0.7.1 vsb.v and vlb.v result in the same
> > + * encoding as the standard vse8.v and vle8.v, compilers seem to optimize
> > + * the call resulting in a different encoding and then using a value for
> > + * the "mop" field that is not part of vector-0.7.1
> > + * So encode specific variants for vstate_save and _restore.
> 
> This wording seems oddly familiar to me, did Heiko not write this?

Yeah, I wasn't sure how to attribute him. He wrote almost all of the
lines in this file, but I put it together into this file. What is the
standard way of doing that?

- Charlie

> 
> > + */
> > +#define THEAD_VSB_V_V0T0		".long	0x02028027\n\t"
> > +#define THEAD_VSB_V_V8T0		".long	0x02028427\n\t"
> > +#define THEAD_VSB_V_V16T0		".long	0x02028827\n\t"
> > +#define THEAD_VSB_V_V24T0		".long	0x02028c27\n\t"
> > +#define THEAD_VLB_V_V0T0		".long	0x012028007\n\t"
> > +#define THEAD_VLB_V_V8T0		".long	0x012028407\n\t"
> > +#define THEAD_VLB_V_V16T0		".long	0x012028807\n\t"
> > +#define THEAD_VLB_V_V24T0		".long	0x012028c07\n\t"
> > 
> > -- 
> > 2.44.0
> > 


