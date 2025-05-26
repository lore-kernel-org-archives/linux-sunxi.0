Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75FA23E35F
	for <linux-sunxi@lists.linux.dev>; Mon, 26 May 2025 21:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748293749; cv=none; b=Mp3VM7ycQ8qpBNSyLiLniCqFmfTrYCVF1PsZWC4midtE22NiPRlj4BbtDc9cvVSmPurLYw3yZeHnUXNQw4QW4/A9/PW+KdjfksbrNqMlwtXwrZA5O6BSvZrejaa2Jri+IPTa3xMTf3QKlGo0GyokShoNoNqvyWV4ytf/s1/ElPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748293749; c=relaxed/simple;
	bh=KR9ydQyBqL+zWssbHMoqdPjTuy3H8LZPz+kipGRjVyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WHrDkLpF86qZfpLFlYmVC6TID0CsHXQXtxt4CcAxRx1IeGBawEfaCeUDAbmJc0ZF6e2Au/fchftKycUtnJeZHWkZ1HYkQxggIVAYMxnvvLmquIgVa92xfxfXRV/AHgPq4oyMQu/rx4LNLXLks2fosFvFy98eTPQdYXjb1FsxseM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJi8/67L; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJi8/67L"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4e58d270436so18576137.3
        for <linux-sunxi@lists.linux.dev>; Mon, 26 May 2025 14:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748293746; x=1748898546; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87fhuAp8NmqR1otDh/HGxIh14e89XZX4r9lz9YqYugM=;
        b=FJi8/67LRHjdWL60p6DzvH8sgKPDSm4RujXDnFb3J1TQUC6WFiXj1W+nU1LDvZFNzQ
         dlqtjYtlmLN/ty88Pdq7TvU7LiH61qWVsc7aQNNS5XAgdRS7rv3x41v/9SLKYVXa38js
         zyxhLkmr5jw4d0+dSZAHE5KUno132x4yVeuWq44nm88UamhZLXP0hwPGWJJqUuIpZpEZ
         6E7R/DhjOAhEcYvJ/yZhskFbXntBWAF0Ethvd2btqWjJVPHhcdjwH39ZFa5N28VKOfQe
         gbJ90c6Zg6CfnKjTmugEw6BD67DtiluK2hedFvUza1mnGMxo1N9TrZU6JKJZ7dUlfnXc
         ikDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748293746; x=1748898546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=87fhuAp8NmqR1otDh/HGxIh14e89XZX4r9lz9YqYugM=;
        b=AyrU+nPKIHGL/ScQJJyE4ZlUj0nSoReL962DLG1LqU8i+Ko1IZ2LbRNJry1lNj1TJ2
         hD0efD54lhwVtLOk97wludU6CwFVCN+isrwnYuyuUb6XpAIHV2RwoCr3YhXyHy+rne/f
         TeoTzUkE31bQm3lKUskISysQLmqMAT7v6tgjv47ojG1qxTf80k+Pyx+PdgalA3ZZuwJo
         PQAvNTGH96WjLAIqH+UzaelLAPLrjE6/hg79kzmQsU/iveCWFDlbdfUrAIWpD6BdQ1TO
         edcJzLqj6Nsq+U9KbqzI3aHI9xfWUTFI1BqwBzjTK7Up5BHMpc6h9koiYTJIEqCwogxp
         VOmw==
X-Forwarded-Encrypted: i=1; AJvYcCUFB1gQAdQrOp6NZ7I81+ZedKn2RXP5vudzPA+DEZWuhDkfYokNSgUWZq/MQrTf0T4DF1cDPuD2g79+Iw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzj7zNIKEJJeyW5RWOKxRcpSjlqLHFdB4BCja6J0Ai0k8hd7j0l
	9xHi4N58l1BhP85+Kq6glQ+99dKkiSYKFWHFUWQU1MhvVdPGLqS4aDV9T2v3HzsF0rCFXy7JtLG
	I5XAC0k2IBk5itStTyt83LD3zp1TG7Sk=
X-Gm-Gg: ASbGncskNXQhqFG2JJF+fWGgKlRDYVJzNlr9NEeULCXrMLj2mkqNSNw86DwWG+8THtL
	ENybAR3rLrgDvFqlmlDWRtGcnrXCQcHWKQhbx10kHD8cfsbGdz2fOKkPB2LgOBA9asZ7Nv/BDSK
	Hbt2MSo0IgOe1AYG0rXAYkcJTSFga1rw/6tA==
X-Google-Smtp-Source: AGHT+IHJS491hwCg7QPzHL8sgVSadrrDFwt5Fkv2jVRTS71w6+V06+FNAv/Rmt5Zw/NYt58vCJJpAIGoZZeec3aMqrg=
X-Received: by 2002:a05:6102:6e85:b0:4e4:5e11:6832 with SMTP id
 ada2fe7eead31-4e45e116d29mr2273063137.7.1748293746485; Mon, 26 May 2025
 14:09:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250526182939.2593553-1-james.hilliard1@gmail.com>
 <20250526182939.2593553-2-james.hilliard1@gmail.com> <a2ac65eb-e240-48f1-b787-c57b5f3ce135@lunn.ch>
In-Reply-To: <a2ac65eb-e240-48f1-b787-c57b5f3ce135@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 May 2025 15:08:54 -0600
X-Gm-Features: AX0GCFvBOmoEuniobTH4Q2bGCB-bMqy5gqMhcJ9AabATXY_w6ImnhtwMSjGOdz0
Message-ID: <CADvTj4rO-thqYE3VZPE0B0fTTR_v=gJDAxBA3=fo501OL+qvNg@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] net: stmmac: dwmac-sun8i: Allow runtime
 AC200/AC300 phy selection
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Feiyang Chen <chenfeiyang@loongson.cn>, Yanteng Si <si.yanteng@linux.dev>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 1:56=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, May 26, 2025 at 12:29:35PM -0600, James Hilliard wrote:
> > The Allwinner H616 ships with two different on-die phy variants, in
> > order to determine the phy being used we need to read an efuse and
> > then select the appropriate PHY based on the AC300 bit.
> >
> > By defining an emac node without a phy-handle we can override the
> > default PHY selection logic in stmmac by passing a specific phy_node
> > selected based on the ac200 and ac300 names in a phys list.
>
> The normal way to do this is phy_find_first().

Sure, but there are problems with that approach here.

The initialization sequences are rather different and the devices
won't be visible on the mdio bus until after they are initialized.

The resets will be specific to either the AC200 or AC300 so we
need to choose the correct PHY based on the efuse value rather
than a mdio bus scan to avoid a circular dependency essentially.

AC200: i2c based reset/init sequence
AC300: mdio based reset/init sequence

>
>     Andrew
>
