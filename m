Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28185499F1D
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Oct 2026 20:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790886408; cv=pass; b=mfVB39m1v0s8pau29hWtSKJReLDvGhEpiDspd3rLGob8MoJvetFV00XSeToSFr0r9hR8wCEnvNFJ0VZjx6qzqos29CT9sIUZBdZU0Mbd8hV5qMsk/2ETk39iyrYx/4f+UpA94vKOX1Bk07oPK/Bfc+PHylUjFSFSlE7pKRe9qFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790886408; c=relaxed/simple;
	bh=v6TVfXTKVxrz9QFCIxsDL9oMH4UbJ/LAus5tXSrEGYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WzPNWyvXNsWlg+A4vdXF0fgXkccRjWehEEsqr7ETFvaM8l0NhoA3o3fFT22M/cxkBx4JQlFQI3DlYxEjHScRDh3gnmNbV34cHOcBZlFNhEZuiDgSQXDokuKdBsM8epxhFDrQv9FylaCKN6bqL2ovSbYP7QzO4eEzv8dpDkMWuYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a4a5mB2p; arc=pass smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a4a5mB2p"
Received: by mail-pj2-f38.google.com with SMTP id 98e67ed59e1d1-3a4b4770191so1611597a91.2
        for <linux-sunxi@lists.linux.dev>; Thu, 01 Oct 2026 13:26:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790886406; cv=none;
        d=google.com; s=arc-20260327;
        b=BnZmTWideopf+T13wSghjMANAek9nrwfzDCBvQo68HILkirkBpifUoaHWTRRpYba1F
         jFdqDvVOjIy9VqT9DndmPMDn3TOoh6E8YGOUZQ3I9We3byl/3Y3LAyYEqc+nICpHCTiL
         XA/Zzo8VF24zdIhHRW+oMY478DQBiHmi44YxHHe8Xg9xKXQBfWuNheSxU6BoiyW92tcO
         zl2emlFrpPdzIqdfiQGcSOxgr/PL3GSel5lx3h5eHgZB4phk33Af5DE6MkSf/4fyBK04
         bwoQ5bn6S0dLxMQRmKYXIzC21kaGVplZokZqLMKne7jmYFMTnq/1C1Go4bkqHl7H2JWZ
         wyvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v6TVfXTKVxrz9QFCIxsDL9oMH4UbJ/LAus5tXSrEGYs=;
        fh=v0aJcA/2rIDkIDTMZWusMn4ONkwepUM9KkowmCTtFRM=;
        b=roQhMEEZqhv+/go1BOiW0sslW4NxJxlQCoeckNY1rK3fFBOeXZ407b3eMvltgTs9I+
         b+TdXPnq7oLOkPhyKpNubFiPed8iim1dOI1cyIVw5mYZOWBCf69YiPdY4KiV1Adka6bu
         ahcynkpCUlcsaG447GquKC4kKk07qf9r4bKcK2VHS3W4IBMYsJiGj1HegpIfUuybIAjW
         D1hNQxbZ2qTsO8PjHTYv3nWMhrsidLqGvwRuU4yNFilx2wkI5ATcprHfnrPSYmk5un53
         F0ovN+wZTgbx026ydmFxc/oUAA8++DgxG6+P645Mlj53j9YfqZR9FFbaeoscAjRMm34m
         Mp6g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790886406; x=1791491206; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v6TVfXTKVxrz9QFCIxsDL9oMH4UbJ/LAus5tXSrEGYs=;
        b=a4a5mB2pOTpQh5NeHIsuVl1WD4RgXrK7eh6KvyKAY+FuO+oItkPGgbDYUVzyz6dp67
         hH0PcMwkQCAeJXgoUlze5nb4DyDzioPrOquzq/yQtJMzSH34BCEFSYzcQo7hJWNIAPD4
         mGopUNJ1L5liKtd66REjY7TERIqlcMxCiXz6KXn++ZirT2/LtZ6WPKfKLjU+GTz/v1t5
         FSmEFqmMjgY+hw0v90iKAO0Lg/jp+Xi1k/YUd1/c2poFRju3MC9MkmNEVnoAsxPu/HKB
         2f3437UWkn8cvsR7Mig7kazaAJbkDnssGqtkQnSFGmXxi8X/uk4AbIK7OSyw2UyPVTlR
         Do1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790886406; x=1791491206;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v6TVfXTKVxrz9QFCIxsDL9oMH4UbJ/LAus5tXSrEGYs=;
        b=VbuGBOP9o/5t4NxAXaRKYkmgXQD+JGJAig9IubucIhb14MVGCmRD34VRT2h/xhPNC5
         bG01+bYyzR+jKuVqY7mQHD4N/Z3nzLWWdu3legO98MYILt0NqpUIF09hB7vn/ZbYCOxG
         y7B/dDIXRGHsisuGotsQS76oFk8ez7Me7/micxbqrDZNOQuU0Jb5DaV1/kP2WqImRHpQ
         VUxrY7f0d2Gs8E/gYmfKZjxo74Syt3gFG+Gg2dbydp9ohVCCx6I2WBIS0oxqDR47PPp9
         UF1XB14iPHh6+USmnUTdGGVJsq/a4EdHs6qaqixHxmjvvr1svNZnbjvx4Sas7tSlE9KQ
         psww==
X-Forwarded-Encrypted: i=1; AKwUvBzq51I2KNByZdDJOtVDcp4+ctmgSpGsk+P0AIEnZCmao7tnZk5Ods1PR2ld5k97iroT2wcSaVztqJWmiQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYL/2Q1ukM70TD6Bm3pmk/0PXSVxNSAqe6EfNErXTN3OTTP0OItD
	X8WPAxzsLhga33rIqwFOo128+202v1t5o6RPmMPpeucN0i5TjZLNJSHk7yumblYa10xBCqDMssv
	LqxQ5BVvEAGq+ZB/kJPTtagukmxeeJ3M=
X-Gm-Gg: AYBFou1L4qptdw0T5NdiV8qawzHfmfyzHTD2HkbaZIoG0jJZGOBBBIo0qOtiChGX8lh
	q37YaZTGw9RvRKwjWKkJx7m/Vve40Umw3qHm/FbjcRuPrphTSpqjXr5U9voMLX0Yqsxk/WoSgvp
	a0NYii8KYwqry7+UGY+H4CEPejGYILV9235fGWfSN41n+F1BJlbBT518duX6XpTCWC+orbRaFXP
	oXHhbYrF1x9Fi56sVtmMi+U8oHKOBzw1FGvTb1RMa/5jzNm9KjkfL3EwIlfZbcKU0mLnF+8moFX
	WyXxGlSt4TlSDLVRCOQINWH09mjBTDTEma/BNYZ0Nj7wpxS86Kn3ogGKx3cjtuFfVXBA0Zg=
X-Received: by 2002:a17:90b:2f04:b0:39e:6c69:f46f with SMTP id
 98e67ed59e1d1-3a6ceb1b955mr639282a91.46.1790886406217; Thu, 01 Oct 2026
 13:26:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260929203634.32998-1-pmazzini@gmail.com> <a15d179f-8a43-4b4a-8bd5-fc0afecad6e0@arm.com>
 <CAD++jL=wEKZ5nRofe09heO8uUa4Cd12SYz3+XPhsStioQ5XTXQ@mail.gmail.com>
 <d9e249b7-baf9-4ad3-a3ae-b9765feca5d8@arm.com> <CAD++jL=bhQ8Pj12wgCi8RaRTEUcrXzhHm+EYA67dBEvn8P_rCw@mail.gmail.com>
In-Reply-To: <CAD++jL=bhQ8Pj12wgCi8RaRTEUcrXzhHm+EYA67dBEvn8P_rCw@mail.gmail.com>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Thu, 1 Oct 2026 21:26:01 +0100
X-Gm-Features: AclHuK9su90nDg_1A2BHnYBV31GZYMfhNVL2X1sfHL0TTMmKMafI4E752265Oww
Message-ID: <CAAxh=js3PiveOSst0brWjw7q+pOXTUbKNahOUcwyEuM0oW0gpg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: dt: number the IRQ banks from the first
 one that has IRQs
To: Linus Walleij <linusw@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre, Linus,

The B288 only has IRQ banks for PB, PD, PF and PG (banks 0-3). With the
current code it would need a made-up first interrupt; with this patch it
doesn't.

Which way would you prefer for B288?

Thanks,
Pablo

On Thu, Oct 1, 2026 at 8:28=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> On Thu, Oct 1, 2026 at 2:31=E2=80=AFPM Andre Przywara <andre.przywara@arm=
.com> wrote:
>
> > So we could revert the DT patch, and take Pablo's code patch, with a
> > Fixes: tag, but that would create some broken combinations meanwhile.
>
> I see it like this was a bug in the DTS file, so this if fine as-is.
>
> > And in any case we should add a word to the binding document, to pin
> > down what's expected here.
>
> Can we enforce it with YAML constraints or is it too open-ended?
>
> Yours,
> Linus Walleij
