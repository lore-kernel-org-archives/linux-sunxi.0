Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A77E30F54A
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Oct 2025 15:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760370886; cv=none; b=ihfdGF8Wa8AlfBrt8lYzBxnppXlxLxLMx5TH3GnX3J2ff+JaJAJl0p1cKH2xVuVhq1ZnzlkvdM0cPGfFJ0WLh9zBf3KwnUD4oURd5hLVjgA4rqb3eQyGS6uTchiDBxg5AW4m8ONnX2kB8uuQCt9E82mP5ewMOLCO481Cxnxyi1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760370886; c=relaxed/simple;
	bh=+UssLPOno9XWeKCQGJZY3GRGKSjKPPao4Ev4zfFKhM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z9Uw96ho6friLNcSVHipIg4d8BvNiJfuznLfMylKoESj239z0EIg4QfQmsTox17E8uveMC+ZBnEEYSnEqaQqOgUFmrA/xiN59z6sUKOUra9ClPa6nPWOVgPbx8z/fQZYaFxI2XGT2zK322rOVf+xbY6uT4X59YD38+4jadnQieQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-58d29830058so5384794e87.0
        for <linux-sunxi@lists.linux.dev>; Mon, 13 Oct 2025 08:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760370879; x=1760975679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+UssLPOno9XWeKCQGJZY3GRGKSjKPPao4Ev4zfFKhM8=;
        b=jafbyWIckz8aIPRG8Gqilw6kB/B//zMGjlw7z5tmPZ/JEw5C0YtVyTDqcwrDu66Axk
         cKEmboUcqAGkH0+vxU860qW3KnpLMMa1YBcUudEvSRvNVTzuglY+BcP+9YauisINIVL2
         eI1ZW+aDPv1gghZqD+Abryhc2CsfC3xs/alx1IVkQeiRs71zm8oIS/w+GwqQ3okaI1oi
         3QvH0XBXIeTm2eAqwmsBeBIuEhfPUEn3atPFoO6L6XOXM3fqomxA7MJJ72x7ziOI49BZ
         q/tUihI3Ix6jg1Qfn8S9ofUqkT0qTEeULQW9acUmnPf8r8QWi4wqLg9LWsCu/m38/pFw
         9nQg==
X-Forwarded-Encrypted: i=1; AJvYcCUC1i2VQs0S+7iuEIMKntvipAPWST7Qm4VcJ5AiDf8OZzlTbQsVSey/1TQxGMchoTsKhRkifB3nhrAhHw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyH4j1Txp17HhD8BamW/m4VylJD85L53/CwrOLgM+1lqgF99XO2
	nt+dpohIhxClDeRM6QOlazGwHTgmwMvftymLrYxqlTGaT2nN+dC/x+N8F62qe7Op
X-Gm-Gg: ASbGncv3iLj6EHydeKBPHpWjwh0Qc4kMR7cGeifMTv9KZSNFl7KDcTICP+kff7WiNsC
	moTmleAiJawDAz01HM+7MhcXojQuvpykOeHXkG7T245HtB6H5bcoVRpB5ztOQpqcb7Mpo7H595+
	KKJIQUyxQw4V/pV5Jmf838lkiBVd6Gp4w95nwzsDCy55hEnoOmtrmnulwpeslUfb3UxWNCOfBXd
	7s4Cn19F5fiyMTQqwGNaxNwGvPRqr5D6CzBmqR1ZN3zxFw4HsTLeStCfkSWsc3jaU/PhGv2xWyn
	CdkrMZHGoErad6hSVGjQuqzJh7MY4uNQoKe9Aa6qZF6kRaIhclwFVmalGfNGWa3uSA5gjcgrBFj
	Ct0/0JwDCDreB9O5pCvzxHQlZzq7/ushe3totLj6hyZQIMRDyXReFJCluetGje+6/mwYP+qeS/y
	RF73aR
X-Google-Smtp-Source: AGHT+IHwhfJ7+KDnJoh9WyzM1MP2yb/ziPLMiX2tyUDfTXMDOAwfZjiZX+ajYuVoYQo8U+8W0foBIQ==
X-Received: by 2002:a05:6512:239d:b0:57d:2796:6b0a with SMTP id 2adb3069b0e04-5906d88b31emr6123527e87.22.1760370878924;
        Mon, 13 Oct 2025 08:54:38 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088577571sm4229731e87.102.2025.10.13.08.54.35
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 08:54:38 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-58d29830058so5384657e87.0
        for <linux-sunxi@lists.linux.dev>; Mon, 13 Oct 2025 08:54:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVD03c+3SE6s6ZcTM5lp/HSAlslQ07QjceVwLVJHZ+FKvEYkk4XPGwdecnK1+GxleLprIyGnd8pQF3ylw==@lists.linux.dev
X-Received: by 2002:a05:6512:3e0e:b0:55f:71ad:590f with SMTP id
 2adb3069b0e04-5906daea8f6mr6270458e87.53.1760370875744; Mon, 13 Oct 2025
 08:54:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251013152645.1119308-1-richard.genoud@bootlin.com> <20251013152645.1119308-3-richard.genoud@bootlin.com>
In-Reply-To: <20251013152645.1119308-3-richard.genoud@bootlin.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 13 Oct 2025 23:54:22 +0800
X-Gmail-Original-Message-ID: <CAGb2v66nojdOfU5oDOCTDummqpcXYuu5665MKJRee2-QfhS36A@mail.gmail.com>
X-Gm-Features: AS18NWDKdIBd1rTcxTVsXd-_vXNa-9kC6YbGbqd54hyWKYs7fg_lZoQPdbhPU9g
Message-ID: <CAGb2v66nojdOfU5oDOCTDummqpcXYuu5665MKJRee2-QfhS36A@mail.gmail.com>
Subject: Re: [PATCH v2 02/15] mtd: rawnand: sunxi: move ECC strenghts in sunxi_nfc_caps
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Wentao Liang <vulab@iscas.ac.cn>, Johan Hovold <johan@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 11:27=E2=80=AFPM Richard Genoud
<richard.genoud@bootlin.com> wrote:
>
> H6/H616 has more ECC strenghts than A10/A23.
>
> Move the ECC strenghts array to sunxi_nfc_caps to make it ready for
> H6/H616 support.
>
> No functional change.
>
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
