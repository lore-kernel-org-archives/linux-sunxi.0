Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD6D1758B
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Feb 2025 15:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739805114; cv=none; b=DW9vBRcDgchWcibE3U2C/i6coU5/yhkA2zpaSf5qtVdANv4vDWBzP8bSfk3HoT+u9YUvWWymn+JEae8y+qqbo/yMHaX3bUa7TSWEGvai5pnIexXAyFKDJctV9qDhFzF7vkmNhMtx5PcJj4v1zvrgqTqidAOVl4WiF6TdMwIPe2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739805114; c=relaxed/simple;
	bh=CX0cKuWIN/izcmRShlftpFObnQaAOxE9smmXy7S4rN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iCzg0KU0J8VJcb9yd0rtfb3Ao4EgG5ukRNztc1DEtmu7k1cjxlx60jY37X6Kmt7TbKQqRFp5Uw8zEAeh9a4qIlXv+psiUvGs3NQGj1yNXQ10wih9rer3E8wfK9doBhFMmljetG6vdwhXikMYXb/tnTByJPaqr2lU1heG4Onb8BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30761be8fa7so44835441fa.2
        for <linux-sunxi@lists.linux.dev>; Mon, 17 Feb 2025 07:11:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739805109; x=1740409909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CX0cKuWIN/izcmRShlftpFObnQaAOxE9smmXy7S4rN8=;
        b=SfyRKx23KFfNDnXy+E8pciefcUUP3Iy76mNQ8l/5Y6J/kAWoUEjj1MsBBLiOHQTdyu
         lGtGIn0H27145fOwPSbtpMJGjw0xQpbygexZy5eqb+KUg4WeGBuwy6E0YJzRSbF6mmhf
         TJO7u2g6CVbDD9IYTKijGG0Bs+UW/R0TS8D99DTQFrdf0yy8amSibRbkXi7ogPjojHoM
         Ajqzu/I8ZwRyE7CtQl2zK3Vo4DOb/Rt/2WywA8E5pOtMLXICJAjTa1zekKmN2zLgRd7D
         HtnkLgQl7EmrctUNbiIpPtAsc/wKCrHITbY50gP4tTeJYZRZFlemWYqmdmrMxowK6SES
         xW1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUw5ZVzTPpQbLw877S1EDFjshqf5cBYPqHT1G8iYaEi1wn0fJRaH8E3TjL5blXlLEEbPGPip22mCWsg0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyA2JsJi0MXf1apzmg23XBcalwW+Ft6dUgC2CgZTZxuU2jhj7mW
	UyhMVtxLJzqAVRdDnFLQtp+ToqybgkfJXWXVceiiWX3OdyAQnUHASig1XxRU
X-Gm-Gg: ASbGnctMeXQH5sOFalKqQZ6oII8yNfoCbTGGzWgnuTyEDFDqjMAVaxbL/LhDliobJqE
	WL8URa5thkqfcYA7qcGMcW4NyIstOu79lFZttKiPr7Xc5k4UoakfTrG4vAQLwBXDLX3AZn0j+P9
	eitH0uC1xHMkSphxi78rmQ70xyy5wH4MA9rRGVWhC0yyfiAp7Mw67+dHE8IhZYS79wT53xyEqcF
	KQq/gHTlkwY4c8DhJ58k3Saint5VKzg7XN6m5AYiTzbrC1HmpVpI+wcVumU/JUGfWr5QBfEtW4y
	CQ5pQ7OF391IGjTlo62IR7XYQFZWD5sRZ8V6b8x9MzX6esZJ
X-Google-Smtp-Source: AGHT+IFy4SN3RGJDm/ENavbFul6L+Km2WCYGiQDkdKMolX9WOJPUuN/qnv9FwFMf1xy7sC3kn4k/nA==
X-Received: by 2002:a05:6512:110b:b0:545:bf4:4bd4 with SMTP id 2adb3069b0e04-5452fe26b34mr2966542e87.7.1739805109098;
        Mon, 17 Feb 2025 07:11:49 -0800 (PST)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5461d603ba8sm632376e87.241.2025.02.17.07.11.48
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 07:11:48 -0800 (PST)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30761be8fa7so44835071fa.2
        for <linux-sunxi@lists.linux.dev>; Mon, 17 Feb 2025 07:11:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+22H+yhkX48pZoWp0DZhPkFIlLRKwZfyUbNXkId/oZceTYJtsUqBJ39HJmnCBxHZGqajs6J8y3Vpp6g==@lists.linux.dev
X-Received: by 2002:a2e:8757:0:b0:308:eb58:657d with SMTP id
 38308e7fff4ca-30927952830mr26737901fa.0.1739805108110; Mon, 17 Feb 2025
 07:11:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250214003734.14944-1-andre.przywara@arm.com> <20250214003734.14944-3-andre.przywara@arm.com>
In-Reply-To: <20250214003734.14944-3-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 17 Feb 2025 23:11:35 +0800
X-Gmail-Original-Message-ID: <CAGb2v66gSuv6egek05QfpRZNH=Rn-eZXxQ_GVfDWpJ-HuojX_w@mail.gmail.com>
X-Gm-Features: AWEUYZnwpP6pvAEUU7QbWQG6w8gtn-pOi6TW3aQOb0FOCh7uCxrlelNQmMUxnZU
Message-ID: <CAGb2v66gSuv6egek05QfpRZNH=Rn-eZXxQ_GVfDWpJ-HuojX_w@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] pinctrl: sunxi: increase number of GPIO bank regulators
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2025 at 8:40=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> By design, the Allwinner pinctrl IP always supported up to 11 GPIO banks,
> though no SoC ever used more than 9 banks so far.
> The Allwinner A523 has pins in all 11 banks, which exceeds the number of
> per-bank regulators that we currently support, as this was set to 9.
>
> Increase the size of the array to hold up to 11 regulator structs, to
> support pins in bank J and K as well.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
