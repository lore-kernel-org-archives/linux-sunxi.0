Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F93276057
	for <linux-sunxi@lists.linux.dev>; Tue, 27 May 2025 19:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748373695; cv=none; b=A/nyE01d0zn9ocw7q33ApoM+hbs+YZgNxub1ivbZjc0aHPx74dcOMW2yoBffRvdRxY8rFhyrPgEz2T0YlNsWjV5g/+EIZKj/arcV1TPSmwffGS2uclFyW6Lhv5/Wcs08DHPC/ZIh0X21OD7om7syy372FjBbMq5JE8kRSdLrZyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748373695; c=relaxed/simple;
	bh=ZOx7q4xf87k1jEIxa4jfUnotqYzGDRVn6aOkwlFU9qs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u7eWi6A4giUo0CVnRcavUwFLGyU7iBANUltdvWlVx+tRLcHJVjwcsaqf96pH1F4IiDnc280NYEFRMXDu/LVI5BB34gvZR3gb4H1awp9TSxBOHw8TksFW0OEDC31uuEXowLpg9NqAtoqRDMlqBmqMgyOMdwEpcrZNTYyLjqqad3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rfe5LMTq; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rfe5LMTq"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4dad6cc2be0so1032876137.1
        for <linux-sunxi@lists.linux.dev>; Tue, 27 May 2025 12:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748373693; x=1748978493; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWXT/WupRqW0CupybvTkEKLCMDuWAmD/tW/zMc48HoA=;
        b=Rfe5LMTql55GK/ft/AWflksKtNRkOordyzPKMtXP3w0ws7PYvMgBalh6P2xe3r407Y
         nGM//9PQ70P5gIcHfGTgG+ZiPbAilNE/2/HBK+7uozVGzca2mEFHqkCQ6UTuA609RwI8
         Ln1bDpc6IhSalPYl1Sb7t4lRMBYUOyTSVmKYmTD5gqESOrf/a++R6PKysdbZcifZXmaj
         6FOyvTECUUa/j2iYQ3jmKjM6T/Rhr7+mKJb2mTLF9sjUYdaAVXLHfJbJ892t+jkVvM+z
         1xGR5xlDR+xnVWSRxDOP8Z6D2nnXV2QV6jZeWlGIR0dHvYlpy/v2Kh2anZbD7GxBLw6v
         Q1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748373693; x=1748978493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWXT/WupRqW0CupybvTkEKLCMDuWAmD/tW/zMc48HoA=;
        b=U14KfUSggIM2EbPdDIa9KN1O36uFUyC8oA88bmJr/jCveaMuUlWPvWalDUkpfLl6cU
         r7dwXnnFimfY4a/Apx+pzlgXNPXZEcX71mdPyKqn7rGHCv/AVAmzp1W+ED5tIH+Gxf+a
         u8nfpxt46CQ2vF+5rkkaFu7qvfRuai1TjmUdRd7hB7m+yejsZRUPaxoOjxIKet97IW2N
         TnhJuQ1um0R1zO+9NasTmUSscIQLc1ryYLUsfFc8PSP5ZdgSLkYXzaOQq9/KtWbc3wIK
         jNLp6cAaVeFAxCDGymo/I+Lv1y6MV0PMph3hLcK81W+Xg332myX8RgYP87elS7GuRH8f
         GOmA==
X-Forwarded-Encrypted: i=1; AJvYcCUtdSTdl3mvQtYaHb9q0DdacMyEz5zrzZwji7F2RtXFFP7WuH9t/jBXAzzIXMyj7I07SufGKMiJ9Gq6MA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZ1oXD5rCtJK41ZYagW5IWGlgIqSIgdUfGYI4+93nTAln2XRTj
	t/7vr9EzshFiLXnGVuGdqeAp9e/QS9s2SRaOUrEmSwx3ObjlLXH+EnMZgONJ5/qpHy4KtMU0Sgl
	Krt3VXQZaL/QGdAY3zm0QHRwC3d3ogs4=
X-Gm-Gg: ASbGnctiU2IpsCWoM7NsNWyl//iuYKcu0kW2eBOwLPJEEqGOpaEQ7Dfp1DXKqjbtmii
	0rRlTtjP+Ai59Ig557Ff1rnyqrASEZYSHBAP+xcYFJ0wwcD3r4Dic2df+i/pEWmbmt7GCcCu9ym
	3gPiFNxoEPwklcDXO7qH9uej5Vo1yb/24VQg==
X-Google-Smtp-Source: AGHT+IEChjVJAaQHlGSjHa9hTKxCJFyJzR7c9+aL/0QxNkhj4bg8SHCtIwSUXtZJZi5/vjBpZfQlumATcldCYDUWxqA=
X-Received: by 2002:a05:6102:290c:b0:4e5:9c06:39d6 with SMTP id
 ada2fe7eead31-4e59c063ae6mr471806137.2.1748373693026; Tue, 27 May 2025
 12:21:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250527175558.2738342-1-james.hilliard1@gmail.com> <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch>
In-Reply-To: <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 May 2025 13:21:21 -0600
X-Gm-Features: AX0GCFvF6Ti9-VC-WdHc6MfKeYhf1F3qOQDDP4BI4jj848sa9rzAvWhhkHP0KPs
Message-ID: <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select
 PHY device
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Russell King <linux@armlinux.org.uk>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Furong Xu <0x1207@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 1:14=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, May 27, 2025 at 11:55:54AM -0600, James Hilliard wrote:
> > Some devices like the Allwinner H616 need the ability to select a phy
> > in cases where multiple PHY's may be present in a device tree due to
> > needing the ability to support multiple SoC variants with runtime
> > PHY selection.
>
> I'm not convinced about this yet. As far as i see, it is different
> variants of the H616. They should have different compatibles, since
> they are not actually compatible, and you should have different DT
> descriptions. So you don't need runtime PHY selection.

Different compatibles for what specifically? I mean the PHY compatibles
are just the generic "ethernet-phy-ieee802.3-c22" compatibles.

>
>         Andrew
