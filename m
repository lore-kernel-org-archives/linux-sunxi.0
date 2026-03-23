Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933613B7776
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 17:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774285843; cv=none; b=JhN1CCI3SeEPiY+AolSbRxUiig9OeLHFS9wY9ibgnCBjD2SOCLkgMeAdozsuwe2VfTuOcjN+ufZk4Mp1qZf5OLq2FwFh3humZe1a0N2ZLKfWPwaSs6NYlI3BGt7nFEUr3DmHAyJpwvuh8bDmANsFV/eTC4GFyJGHgbHX09JLCr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774285843; c=relaxed/simple;
	bh=5wdgibwLF96dQBbZ/WtNrCZzbZ9lrlLtoVcZ8BLt69M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=acNj0JAdHgyJ7I+xo7APkTpBI5R7xGwR4SLLdWSNX8GTUx7Tn4nNnIW9SrYXBzm8G77o502qp82fMlMYq3WA2dh45hn5wSz2cV9hZughRdyVNpFUaj23bsFjJIU2aFL/V9g9blInAKrLF+TUdDarKG0Gxlz/eLaXAqzSyZCVZt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3878de20527so22248161fa.3
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 10:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774285841; x=1774890641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5wdgibwLF96dQBbZ/WtNrCZzbZ9lrlLtoVcZ8BLt69M=;
        b=FnM2f9bNhlQQKBrarV4Aq1cG9HNVSro5hyWkV40qTbUWhR9+1sLgUvhKWdKQ6BssVE
         C5c5SN2cQSba04RYvWqIUJfz9dY41MNZ48FMdU1AsH6kfDCkFE5ihCMKMD4JD3ZOvd6W
         ZUiirzETrBRwJ/YU9Ec+S/7KrV/W0g8D88TrwZuRrbIB8scUpj1Q6RRbmmivXFqRRptG
         W8POfrxOc9z0XaLgV//bVa5FI+U+0SxU378Z6tp7HXo/GaPcQAXw3frnJ2TlR2j9HhDC
         C5yLAchU/Ruwnhwo4NGmTquiWDMmq6hwpRf6hlxuGyVWT1LbjKuGuWgJRKS8u/uZnstn
         gNRw==
X-Forwarded-Encrypted: i=1; AJvYcCW4MrSBxfVYUo6GqRwLyweFXrf9aWdjvMbk2pZ+3GFejLkkqzIQaoIN+8oBl+icnCYLZwgzpc8ynJ3DQg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyD2RlV2U/ksTwLsDmtEClztnQJb8Eis9PQHJVtf150WrktfBme
	JHzosqlaZ4AgkxR3YlxFw35kBKlH7PgKvHv4GjDgrPFKXGXrjFKASd8aVdKZK0Bv
X-Gm-Gg: ATEYQzx8NMSVSCyILDc6NnXf+3sGUznsCF90MJM7ID3u30/5t7aP7vhBbMUq6BElfbk
	dAzoZuYDnE1OZVJJSpaDC/X0Ptk0W6SqcU/T1ENY4ucHMDrWUpk7O0fzQniB8Y6uWMaZy0cEgcL
	SE3V6hlNnTxaBcNh7vUVRwAD262GP9qZHsFqAhaPeidUB/iy1IYJx2sBeiPz7D8UO7myur4Sr9y
	WL+2ezOqqXm9djwQxzS4JrapJgduOn6wd4KegyD01M5ZBsbDQCBNWfVXvVToF7Jx/lSHsMng1yK
	VMXaI2lHNlIbL4IuWTi+KIDgxbYFDSj85AhMWbgQ6d7LlrO2PmFU+edzZbd9aWLcxpLIzmnVwkU
	E0RCOYm3lO3ghYT5M7hA8uUNZqkf9f8Shu8Bz81EehBr6FgsPACNT3znpnvMmCiTC5VJ7eItBr/
	AMOEe2OXsnhq1U/3Rm1jFBoBnJPYK90DFnFOjySY0Yqy7QgdJCk+3s9U8=
X-Received: by 2002:a2e:bc20:0:b0:38a:2ada:a2f5 with SMTP id 38308e7fff4ca-38bf96bdd7bmr42338901fa.19.1774285840748;
        Mon, 23 Mar 2026 10:10:40 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf97439c9sm28896871fa.10.2026.03.23.10.10.40
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 10:10:40 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38bcda08c76so28383321fa.0
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 10:10:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWWpGnScOG70EKuUf8t//EEFiJKr8NB2llsbmSRqshJF9uG95cqklmVIO5F8M5eO9H3+5p9fU5IYXN8fw==@lists.linux.dev
X-Received: by 2002:a2e:ae0a:0:10b0:38b:f110:aff2 with SMTP id
 38308e7fff4ca-38bf962a085mr30981391fa.14.1774285840106; Mon, 23 Mar 2026
 10:10:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260323110151.2352832-1-andre.przywara@arm.com> <20260323110151.2352832-4-andre.przywara@arm.com>
In-Reply-To: <20260323110151.2352832-4-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 24 Mar 2026 01:10:28 +0800
X-Gmail-Original-Message-ID: <CAGb2v66j9vNEZ1_srapB9T2ASiTt5ERPfS24LE=aOKAMPt_-Ow@mail.gmail.com>
X-Gm-Features: AQROBzDk1tGxLjoHwtXmw1tvFQAdkXahJu6ZBHXleJQXSQSs109gwXgcaBwuezI
Message-ID: <CAGb2v66j9vNEZ1_srapB9T2ASiTt5ERPfS24LE=aOKAMPt_-Ow@mail.gmail.com>
Subject: Re: [PATCH 3/5] dt-bindings: pinctrl: sun55i-a523: increase IRQ bank number
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michal Piekos <michal.piekos@mmpsystems.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 7:02=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The Allwinner A523 SoC implements 10 GPIO banks in the first pinctrl
> instance, but it skips the first bank (PortA), so their index goes from
> 1 to 10. The same is actually true for the IRQ banks: there are registers
> for 11 banks, though the first bank is not implemented (RAZ/WI).
> In contrast to previous SoCs, the count of the IRQ banks starts with this
> first unimplemented bank, so we need to provide an interrupt for it.
> And indeed the A523 user manual lists an interrupt number for PortA, so w=
e
> need to increase the maximum number of interrupts per pin controller to 1=
1,
> to be able to assign the correct interrupt number for each bank.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
