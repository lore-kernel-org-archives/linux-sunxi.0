Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0E2320CCF
	for <linux-sunxi@lists.linux.dev>; Sat, 14 Mar 2026 08:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773475562; cv=none; b=oMOUXuX8rN55LD8+CyrUc+fXumRJMxvkzhzd9Gsd2Ux0C48FfmhkpH5YaP6wDFd6HGj+lkPm2hcXdYGcyK5S6LvGl5L+C/Kj9fNJEmVUM2mhSQIOuQRWjHFpYXYSof8REVByQ8W+6RMlP2yrFMCw9Douekj2mcf7LiS8PcF35iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773475562; c=relaxed/simple;
	bh=R3EWWpaovkuLWLz+sEJkJgXI3eScPJ1f3CVwzfTX0zg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O61nCAzqZtJL2EWypAND8R4au4hVKRi0ZLPvuiK/2rW4rykyv9xjPQP3Jav1zIfMIISkkn1F+ew+g6vFH/+x58qsmHzMNkC3RZauie9OIesRrkeyUUB9iPd6Sgds5V08Hm4ahqNsJM7YBaqeNrzjMeHAuRBmVSnyf8SEtXkUrFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a1273de95aso4213641e87.0
        for <linux-sunxi@lists.linux.dev>; Sat, 14 Mar 2026 01:06:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773475557; x=1774080357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R3EWWpaovkuLWLz+sEJkJgXI3eScPJ1f3CVwzfTX0zg=;
        b=crn6+TbLqZixZVE9IrVzXFTiugb4kEpen4wUnBVEGJinUlCTdz7viqzVLxu9CWqRv4
         CZE86Zdv6I7p/MUKZ4ow0hdSY2lCPQe+AGR3pbMyL6FCAHSCgpVc+Y1/OKOmuKT8P6fU
         trEhiIX91bvtNjb0/Ok+rx54iAtAwHp7gBv3zJsGlOGjRfHbrOeIWDl/lfHXaKKE3poO
         AdH7vZ7OXa6v0NP9nUGDdnBoHrdRTl5Z4Jzq+5XxhhM+neTrmpgScmuGNcx8pk3GFmnp
         Mqlk+sG0VUWHXud7JxtOSi3y8VYhMHazTDL0CSuGxoihWq0sKRAa8uJGDdNF9eFd5bFz
         FeOg==
X-Forwarded-Encrypted: i=1; AJvYcCVXRUpUWuuR9dnqltwEHkW4xUDsihOS+7excs3bk0hl6dFDf3Ut3Nc008L0wvt64W6FymfXLF8TTVJTkg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYBVWY0H0jNpi+W+wgEjSPKAMIRvEkJ4oO/4qO2bMFspkHLugx
	TFmor68ND8uQjmlJGVQGFjrYzgU5cw9sMG9iU/lcmt4Ue+BrO8xe84PlLLF8DX0r
X-Gm-Gg: ATEYQzxuPgODLrPqQoewTtMUpVIKqkiEaROgeQH908ugZYpP3vuFhkNUBFNsPA02IQ7
	7vLJhiZNSVj/Q5QyYqHi3phynmlJYEg2HsFsoFldnA/wXSKKq9us0iOzvxkD5E4qT0woQ4JePpf
	ln392efstB3YDY1dxStQhxiYRJqP0MDDRBC+xTHkDjvfl7Buj5O+yyYY2rl/ibBv2tjH7wpYegh
	+ICCIswtygU6H57K4yn3AS8u5AogoKlj7TvSlgDBQWhS12ymHsNVDF+oM7yc5aS+esY68cQbzTk
	WzLiCKSn05kgV+gsQ4ZAiIRJUtmLJBByahhjciGyAOJzWEtx/HOunLeGdm95DBO4rFaAWvDE4dH
	PaSf3VLJQ6e+0/YOJdptf6DtrZh6jWH7GFbCU82JgvD29h2owTvfNDzCl6pIrbssWC75dpTNP7O
	HEi66j6nj4ngJeUSCV9OT+smED13Cri8UGIsWE+b0oCeW9SbCMep/zpuQ=
X-Received: by 2002:a05:6512:1596:b0:5a1:26f7:71b with SMTP id 2adb3069b0e04-5a1626c1517mr2385701e87.0.1773475557363;
        Sat, 14 Mar 2026 01:05:57 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162b08sm1977811e87.53.2026.03.14.01.05.51
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 01:05:54 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-389f9895c81so27319511fa.2
        for <linux-sunxi@lists.linux.dev>; Sat, 14 Mar 2026 01:05:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4jwWdFxNn7Mn8xxI4VJoFVKhlR6Lr9fIEkJpz5kfwF138hlRpeewQ+PjGyt7tEZm7WXBgZv22tC/0Gg==@lists.linux.dev
X-Received: by 2002:a2e:be87:0:b0:38a:6acb:eb13 with SMTP id
 38308e7fff4ca-38a8969872fmr19535261fa.11.1773475550494; Sat, 14 Mar 2026
 01:05:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260305100137.2558423-1-richard.genoud@bootlin.com> <20260305100137.2558423-2-richard.genoud@bootlin.com>
In-Reply-To: <20260305100137.2558423-2-richard.genoud@bootlin.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 14 Mar 2026 16:05:37 +0800
X-Gmail-Original-Message-ID: <CAGb2v64DAuSEoFKTcdUeBjj7D8b5BiMbzo+M1xnx_A7fia5rgA@mail.gmail.com>
X-Gm-Features: AaiRm50SXV4USJv7ufJ5S1CHMI-l-YGJ1ASLNXxXfC-UNKPRkpq29G52tlurn4k
Message-ID: <CAGb2v64DAuSEoFKTcdUeBjj7D8b5BiMbzo+M1xnx_A7fia5rgA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] mtd: rawnand: sunxi: sunxi_nand_ooblayout_free
 code clarification
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Wentao Liang <vulab@iscas.ac.cn>, 
	Maxime Ripard <mripard@kernel.org>, Boris Brezillon <bbrezillon@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 6:02=E2=80=AFPM Richard Genoud
<richard.genoud@bootlin.com> wrote:
>
> The available length is really USER_DATA_LEN - 2 instead of just 2 (the
> user data length minus the BBM length)
> USER_DATA_LEN being 4, that doesn't change anything now, but if
> USER_DATA_LEN changes, it will.
>
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
