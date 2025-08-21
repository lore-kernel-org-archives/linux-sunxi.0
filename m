Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F1530DD3E
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Aug 2025 11:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755775772; cv=none; b=l+j1SseQwVkUcWkzL0PL2hcKfAjl4pYmy8/FTk3fZTvq7qysi36z4tN2D6yW1wCy5KtBVRbs0a2XrJH2xIBBI83xUnFXll9I+r3h0Alzdr9Dh97IJBQU7GoqEBIN380oc+eb735AS/CaQ1nLKM2XdwHj+yzEfrZ3NnNvFKaeLhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755775772; c=relaxed/simple;
	bh=ugqKLFVMtPcn++sTmPVPHBoR7r9xcjVBC4sj6ZCWHTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ieqbtPy2Ql6OJlTFdl21mroS1xWkGjAP+ic5DhiztXmGVn5HHR16DLT5ocAU+X95xcZv2buaiDK52cgM4ydyiavCYBChkrsgsaMQMTg6sfcxDKgnG1p7/sG5AvEi/DLTachdWEyrPB69Wl4GLYnUQje29mC58FOUBLrblI0TS+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=igR4N9Yd; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="igR4N9Yd"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-333f92cb94eso7619081fa.3
        for <linux-sunxi@lists.linux.dev>; Thu, 21 Aug 2025 04:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755775769; x=1756380569; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thHtO2n6sNZWx1SbCy0fCNK9DuaQMmc6UdcyydBr01s=;
        b=igR4N9Yd9rHOMh2s21DushC79TMPxboCK3vjpqfOdqTQrupZBw92HVGIY43aqXFF9S
         mO4iXxC+5ix1TbrX/q5YIQYChSJZFBw/bvGJ3OogaJDz1V67elsZFOq+N75r3ZifMM0m
         B0oXIlvQhIkeQa7xNzhb2LSQ/xqJ4OaPlSH0LWPuj9oVzLdB/qHDtnJJU6crG2OPSGnY
         ppAGfn2YtPoXi+Vw/897MMcCoLj46krhhOaAjVhOnTx1ic8sQ2pCJfztpUhHEqXAV7Nd
         TRSp7thhbuhDUU6cjKfxhNSzlC4Ibd1LqWn1oXR0xFx+MaiR75Nqg5PdurvzizB74I0E
         8nFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755775769; x=1756380569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=thHtO2n6sNZWx1SbCy0fCNK9DuaQMmc6UdcyydBr01s=;
        b=SiXlkGZBNLxGWlfsoXZmmYY0EJqCkZXrXqp1feAtAibo5tHmncBOyIXiD8rRMOZfUF
         T7SI6ffOvEfBGTcgFAGtHgo/K8dlrpcOPQeFxkwY9+k012o5NqfLewvCGSu1ZP5qkRNV
         odMjzCOgQZMdHsyuKueIixPkz6lm8vbFzd1y3GMoIZCniWUhbpLFXKQhDy7/xXNZTlTL
         4cXpMwdAOuvp75yHhZZEs8zWVYaZwTyya6YGlboFsVWANxfaafHocqQJF9cwuQR2vMVi
         tkQsgH/NJDKSRVauRf33b8Nby5zo2cbSkVNM3pH637u+eyG58B9fSPw5N3d+SZ4tBV2F
         gCfg==
X-Forwarded-Encrypted: i=1; AJvYcCXLChb8RM/anMjNqUadpeL0Zhta5dQpkvSGEkh+ku9Ipr7s96sV16LLusLnSC+8/r1R1Wn+oQONrFDhaQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwIAcws1VJ6ArlquavW1nFJQVQxiqE4koNrZqWYVnRuSkuN2YMZ
	GHA4tJtO5/JxDVCoE6GwtWG67RdGXkahfEDjGI+VLfh3X7dUHlCjOcmouwTCCbEpjEq4oxNnFGW
	nrNKjJX2Hys1sSOvrAEK1+dAtg6+E2+WClRU/qK626w==
X-Gm-Gg: ASbGncvc20++P6a5ju2UXck0K3GbN+ll7XXPmORJanziCMTmxTHec430Paa2cFmg9jj
	YJxrNgeQ2wSn9DHayAE1WGiNLdUF4732fTDHaRnYpTGkCqGv3M5SiIPreDU/kUUH3g7P8dYTYr7
	Z7ucpYZaQeuDDTOSoJMJpHTf0HQBFIqHHMvN+OHujIa0NZ3jqjWae70Clr2STkryPTN7sXTSNJo
	jsXbZs=
X-Google-Smtp-Source: AGHT+IHQpbI8EfP56lsdQ7upknLdRczUpIad68ohDd+RyXmgnTMqsII7yK6Kd5DP/t9BtkAowd9rcI8Mod9ChuDrSAE=
X-Received: by 2002:a2e:bc15:0:b0:32a:6b16:3a27 with SMTP id
 38308e7fff4ca-33549fcf105mr6386421fa.35.1755775768541; Thu, 21 Aug 2025
 04:29:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250819143935.372084-1-rongqianfeng@vivo.com>
In-Reply-To: <20250819143935.372084-1-rongqianfeng@vivo.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Aug 2025 13:29:17 +0200
X-Gm-Features: Ac12FXyxvIa75EjP0r9nO3EJkEnBx3tdsuFNWsnV0Q0Q5_jZ7NS8Y38A1xB9ZIg
Message-ID: <CACRpkdZrDRH9figXST9G7QbJbwSJqg4E3eXmXQ-+2z=k2+jYjg@mail.gmail.com>
Subject: Re: [PATCH 0/4] pinctrl: use kcalloc() instead of kzalloc()
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, 
	"maintainer:ARM/Microchip Sparx5 SoC support" <UNGLinuxDriver@microchip.com>, Michal Simek <michal.simek@amd.com>, 
	Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	"moderated list:ARM/Microchip Sparx5 SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 4:39=E2=80=AFPM Qianfeng Rong <rongqianfeng@vivo.co=
m> wrote:

> Replace devm_kzalloc() with devm_kcalloc() in drivers/pinctrl.  As noted
> in the kernel documentation [1], open-coded multiplication in allocator
> arguments is discouraged because it can lead to integer overflow.
>
> Use devm_kcalloc() to gain built-in overflow protection, making memory
> allocation safer when calculating allocation size compared to explicit
> multiplication.

All patches applied!

Yours,
Linus Walleij
