Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795162611;
	b=T03OY3/O/CzHQHQePMY/2WekKBPUqhHxMdMtSE8GgD1izd4DHPr6dt9JnNV6u8z6JAMZ
	 hSJXV9BzpfekZ3bMIZQNoYZjikbM5rHO5dcGCmk65urgodl/E1vrcs8YKxoC6x0kQmQyQ
	 v755woK0egNBnMtIjuyPEgspU7VJEdjCjQPcQFxBX3CjL/9E+lqQi0rRWfhHos4rXmKyY
	 2oEEt3SIWSiOqHiUA2uGIJjE8Rpm+Q4d+/RfYO9+FA/3P3QJaNu/DVU7pYH0ihAHzvZsw
	 Uhk5gOinjx2fNjrW2Oij7QR6pmctgiNC2Z5klBYfmdl8x3Ysx5sMtKMkTb9eG3Uqw3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DTrRBBbOjFLAct0zJAH34zNdYPnC8LWnjifmPkUTr3s=;
	b=w4UzTNSCYlFB21KWwv/k3L+/gCgR0FicTPTzBvpPFJmmwCqpxJSy1yZOJtOP/HfdHDkA
	 6Pgpa5D7nUWAGile9UJ9NmS3gICsVRthR//ZyLhjcjy0wu1gTOHwpEBVZVmlpzg8WoUsk
	 SBDBV2F/SMh3Uz99DVhcelTiAWoH5CfElGM04SsYIerCR7V+BOXLtg9qoAHufzdXAmhhO
	 RLBs+dZTAZFmIdejd17YYLBDhS3uDDHc4QoHv13rvE5il0y0gfvGJx5Xgal9BR6DpliBI
	 hWTZf554HNJr2ZqXkjsqfa3wg+hvYqNqBS+Tlbqyu0y9lstZPo1I3lC4V4VlZa9TLCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OMmq7fBY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.52
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F3B60A2601
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 08:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77F3B60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OMmq7fBY
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-99e0db26c4bso184221241.2
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 00:16:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795162609; cv=none;
        d=google.com; s=arc-20260327;
        b=h6s8K5ERoMGLQ1tb1hS/K5tTp4BdRLBCPDCJyI/OT88pTDW96wePaykiEg17gkIREE
         IFi882jWnbsWURPcTMcgbfs69hRnY9mOtn8cpgEJXHpdDSFY+nrGc11ckZaqQzCdFsqm
         stzsQX0xCyqdUBSnTadd/ZRN3JtnjGRyXxy7/2VIaajt+jZMj5nRvWyWiFX5kER6eb1n
         yP6S59lvbt02Po/naGfUAxh3YJLACFQxg9iQ0yGRkCT2444eUe5p026Jv13VLFP1ULNL
         djGxdr/RZCCWyZ1daNvT+f5/sCR/K80FgFR5eNo8Swcmkryww8l1HF4oFMdMk4rolufK
         2jyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DTrRBBbOjFLAct0zJAH34zNdYPnC8LWnjifmPkUTr3s=;
        fh=WWSE3rO7GNIeSPtE+02IuCpZq5LWOdZI3jf3NK4TNL8=;
        b=Nymi4npfNAFhv51nPkJg8GvjHv3DCSoA4NWCO91Ji+C4wKaUFv1pmBvTnh6blReuPy
         EcutcyFuAyfwqDjSaEHNT9115HKnLc60MMqnBvgU9ilJzHhK/U4atZPXjY35zxpcOOGI
         hAVA4pntqTNkgvJWV6sEOJBclLFMAiHoLtix4J9UrLhKJh4jFQxa7jozfY5Z7ODrzaVd
         XN3bYwK8JXsosev7rkL24kcznAydS3GoxaqKcILOvcSQF5P9a/toW/C8VuAdYc7HlN1g
         WFbANy9vassTxsv2WZ8ebIfmxIR6A22GTfWelQO+eJu0UPk+12y91/MapzAM0ebW2pva
         kCtg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162609; x=1795767409; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DTrRBBbOjFLAct0zJAH34zNdYPnC8LWnjifmPkUTr3s=;
        b=OMmq7fBYJmYDDO0YPkpMBfbewIII60RRA+EsFLvymtpcUzRjQCocRlE1FL+ZUnWkju
         hNz0gLudjmtALnAZzwrbKAwQAVwh9VqVVcg5qaFgNrTxSJ3CwU5/IJt1oIxsaqv7UDMc
         /BwDhqH74V1ReKYCdrAFfUlzAPwaDKUBKDA7Gxv0BrBLHoPc3KVFeRTyyYYioUwH1ETg
         fdTGezZIpM+oo0fZlMONmAzsy7EG+ejhVPvCM4Uts47MKztTYGazMrVLOalhxNfBRcUw
         GublB8bFrgFz8ZzPJTl8ZsbyWERuiEehsoTl6LIM8Q/YZZyqsefjacWngsFsb2+ayLuo
         I+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162609; x=1795767409;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DTrRBBbOjFLAct0zJAH34zNdYPnC8LWnjifmPkUTr3s=;
        b=n6bS0nFwfz+VuZ6nxnCouOfOVkv7iZtkwfa0a+xP7n1NSEiV73lWfT/biv54TMlWDz
         QtSZMt/PFP1h6xPpPUi07hSMeMhanm92zuCmBELNfYtZLj75anoukllNc6GVCLYC+OKY
         tdagK6lxwZyH8PL08ttSM0Wk7jyfsw/1hcwtPaEf+vdGA5x9EquLF9Ap/GkfzdnfOfSz
         /Hz9y1Hwbk14GEOYaGnTM3Qn1sNb8Yx4Z4lWUrNxFsUo1AMv6qBq+jUYjL2N9aEowBhi
         iMExSEXvJISEb8Z9NcB89GBAtF1S7PaGqXwAooaMwx8xUcsfm3NTBNJkKR9vEx8aVnCN
         0otQ==
X-Forwarded-Encrypted: i=1; AL+hErH6NsRvhbrOJTRQz4OiD8h69GuuuJFULdvvvVdse3+Y/jtIxF5KUpUGuZJXbP8nlaXSpB7KNZ5WGRoyZw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/vI5J6ppCS8iZYyfoCcFzTBN2JLYdhC9pGgi4cu2stGimNuuYr
	pdMzH7Y5BTqx9vVcTblJB/FvzdsS5dyIaL2WzQJEPA4GV/pLFhI21kd5LiWhQl08EXmx9HegrxW
	JlzV1y1Pwr8WRV0Dc9emEV6yQ2zuX5Fs=
X-Gm-Gg: AZFdTZdMJ1QcSunHNAT0U+sbsKYbKRt0B81ItjmnZgEESeebELwP2qELP0H2Stp9d9x
	fnJPULMIAMFmlcWu8yU6/wOJN17Vu4oOGYMQ49F/qTkTn6nViztfgv5HLmDQrIyiCw9AFgQ6xi6
	SQQVbiOXpzm63efKYNTvpnTgKCIgLSs7DVWgdty3cHMhh9s+/eemlibQ3XPvZiPC5IkLoT4TJUI
	9pBPZCU/qsAHXJ5Wm+fLDCdEwvkyXfPCnTv65Kf5w5Ev+npGZbRb9gfG6JlfoIMTl1THW5h0WTa
	9w8ZeVtavBtjKZ12Y2ZTmvJ0BA7TmHaKKk8EZS+1aKdEt/ht3tKXkfZMci5PE9TXtiFurTIfyN+
	h/lVKMEvKpaJOINHV7KN+tCnpiizjfX2FRaNDMMuZwxKsarLKkHvf7PyAdoNixl3cllw3yeYpLx
	0Bg1r4wgPUzPjn9XZNdPKPt9zWn6PFjPjPHI3nnBN0CRjnaWP/4gBzltGEvIjqXAY5QpA3Inarl
	6opXmMkJVSCtBJgv0nsYAMRNZCHrg==
X-Received: by 2002:a05:6102:5cc8:b0:7c5:4da3:aefb with SMTP id
 ada2fe7eead31-7d7396b4513mr725084137.34.1795162609310; Fri, 20 Nov 2026
 00:16:49 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-0-7b857ad1198d@gmail.com>
 <20261021-submit-sun50i-h616-apb2-clock-v1-v1-1-7b857ad1198d@gmail.com> <CAGb2v642E3bDZ60_3oA7CN=hOVGn757RwfVaZWXvRSuWoo5kag@mail.gmail.com>
In-Reply-To: <CAGb2v642E3bDZ60_3oA7CN=hOVGn757RwfVaZWXvRSuWoo5kag@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 01:16:38 -0700
X-Gm-Features: Aa3M54opK0HsAqJ5IKoxodsp8AVX0yGJFnC-piFBxQLeC7dh0z1JF0IENGFsfTk
Message-ID: <CADvTj4pkgZj77566ni_ifFJODRC0XvvOddiOij4kGRxoseBqfA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: sun50i-h616: export the APB2 clock
To: wens@kernel.org
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 10:02=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wro=
te:
>
> On Thu, Oct 22, 2026 at 8:09=E2=80=AFAM James Hilliard
> <james.hilliard1@gmail.com> wrote:
> >
> > UARTs use APB2 as their baud clock. Expose its existing clock ID so dev=
ice
>
> And how did you discover this? How did you differentiate this from it jus=
t
> using a combined clock from the UART bus gate, which is also driven from
> APB2?

I got APB2 from section 9.2.3.5.2 of the H616 manual, which says
=E2=80=9CSCLK is usually APB2.=E2=80=9D I took that to mean the UART needed=
 a separate
reference to APB2 in DT.

> I'm not adding this simply because you want / need a baud clk that you
> can set the rate on. That's the wrong way to go about this. You should
> just add CLK_SET_RATE_PARENT to the bus gates. And making the bus clocks
> variable is a whole different discussion.

I tried your suggestion on H616. With CLK_SET_RATE_PARENT on the UART
bus gates, I can change the baud rate using just the existing gate
clock. So I don't think we need to export CLK_APB2 for the UARTs.

>
>
> ChenYu
>
> > trees can describe it separately from the per-port bus gate. Keep the
> > existing clock numbering.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  include/dt-bindings/clock/sun50i-h616-ccu.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/include/dt-bindings/clock/sun50i-h616-ccu.h b/include/dt-b=
indings/clock/sun50i-h616-ccu.h
> > index 6889405f9fec..e3318772c92d 100644
> > --- a/include/dt-bindings/clock/sun50i-h616-ccu.h
> > +++ b/include/dt-bindings/clock/sun50i-h616-ccu.h
> > @@ -11,6 +11,7 @@
> >  #define CLK_CPUX               21
> >
> >  #define CLK_APB1               26
> > +#define CLK_APB2               27
> >
> >  #define CLK_DE                 29
> >  #define CLK_BUS_DE             30
> >
> > --
> > 2.53.0
> >
> >
