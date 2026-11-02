Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630564;
	b=upXyIq1D9AnAXNIEW7cThlDUUyKcHmAiBBcQIk8GojtBUVE8rZyFx6n8ApBv0opTMf4i
	 LoHjWjPmKztm8HIAwKviEqxxo0tGX7xG7awPlkoPt7xCPq+8kmV0UDxDBLXA5Yzo8O9MB
	 rXWayLQZAFQS/qR70WcTJWWIk9p0DJcthTbzkRMC87jBuKQHnHbYf1PGFeici33WjCvwV
	 PH2mJJKQhDU0DdjiXOwbhxz9qCJyqd/HLh9eiOgTL36Os5heky1JZI8g2rKgKypSkl8O7
	 8CoV8KAxXU0Wl+Ea4yMLgEKsC2UmAivymzRPuR+kV6/OjQAz21tp8oSD6Ggp/d4poow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-Clacks-Overhead;
	bh=FyFelsg1WCcYhQm//KmvoS1XOtUk3Xgy5562+qFwqnQ=;
	b=b041S7ITlKjsWF/j60UQ7tD6gtY88SgQWuHIoHyuEUZRBHcPoGC3tAEpnpGMrV4aja0a
	 dA6UMP0x+WNd68nSyDmosWiQt9MIK1ZkdoIfFs3O9PpMW9pQ/hjKNR9OeuDZIk2/sLgcm
	 Ty3EF+cLHK+5XjpWzgvR9WGC4Y1SJ9K9BaoJ6Oz20dcam43ifYPwI3qH+WE4qwQzOTjPZ
	 lBaRo5dPtNNbDTRf4iyYLWX3Ggb3Wnx0B33EV79mBY/WagFBQQcb35BT53SDQDJm07cWM
	 DjaqpXu0OnIbNT4O0SEbOShqk+JqLmfxUxDuZp3udG5QgQyNYq3FXJwUoC3sVwzKY8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=konsulko.com;
	spf=pass smtp.mailfrom=konsulko.com;
	dkim=pass header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b="Aro/cJsq";
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE1D607F6D8
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Nov 2026 14:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAE1D607F6D8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=Aro/cJsq
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-843b6f8e2c7so4103667a34.1
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Nov 2026 06:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793630563; x=1794235363; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FyFelsg1WCcYhQm//KmvoS1XOtUk3Xgy5562+qFwqnQ=;
        b=Aro/cJsqhqzRfrJZPX1X0+TFVBoHP6wfSRkoaqNWq32HnAHLu4LNI+2qkdA3LQY7VA
         L9L7ECY52Y7TGpQSXKc4p34URNojrPK6ZVeCH5bkqMq/fx6BeQjqJkKRaYujJESiCE8O
         fX3CZ21HDUXm/J55H017yQ2NpyhMGp5a/hrdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630563; x=1794235363;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FyFelsg1WCcYhQm//KmvoS1XOtUk3Xgy5562+qFwqnQ=;
        b=QkQYygh7xvdmlpJHU4++Vdvl7zStnPl7XDOCr+j/zs0i55PJnFuUIu1qAOjiYZcyJM
         jKrHXRLQx3UTlpbvYQv3demEAuoHbO+ahfsXp6Vyrk0V7qrALvqYUNk9V8PkEHGXxLzm
         otQsQ4fmL8Rv4zJ/7yd65vS4gkoq91/UfZc/b7I43SXk05OO0/74XTV1lt7nkTQGfn6Z
         4kn1Ujtk/KY19HZxzJlQeraMqxaoK410gop9EMTU7tdNBtLC7W2cASOHRLxWIMye0cUg
         e+IRP8VVCJo3dLuDq4RXk8wsJQ4IIGgsk0Yspl8m2tzrVWfYKFiUQ1ptNo//AkzEkq93
         SSug==
X-Forwarded-Encrypted: i=1; AKwUvByKvOVpxlVs2WPkpnNDz/t9n9IqSO+BjsPa57Ll/05Ob/Twv92Uc/fMxYuZVckOXtesMvcJcDfVX4wx/g==@lists.linux.dev
X-Gm-Message-State: AFq9FYLlt050rqToOwHCqjVD59xcTnfnebvi1tdZjc3kYuHCTUXM2443
	9GHMSpL2PI2/f4ujBT209J4IE1GRuG4Hbfy15P989Dk7TPW+XnHk0LPujr0ZaTzdie4=
X-Gm-Gg: AYBFou1NiEGmiZCbNdJO9TX30g4l9OHljQHzR+1xSddA5Mx2LvkNzAUhcfSsak4A8O9
	UMacPYmJfhteVjtufmy+gRjHuyrF9RDcFd0xpjmZZVd8d542kuckGknBFDXlW4JHLcFe4Bv3wRs
	dz6ZPFd1IPInhzbZR9EqB7nTctbOZezT6tByNj6YPYZ3DPEwhUYWZd0N0BgjgIXJKvpItUgyQrW
	03jIhSPk+XtFHTwAhC6diwnBAIM8KGcCyZDR+8JNQNezdv+cZfYBVii2QkcmDlj+QFiISSpjNjr
	DBiqQvl8NM5FVEd29Od3DOT4jTVGoorglujY0lLGu6Da3PXCSw3wo5afSY3rxWa/1ULdhQKxbg5
	VsJ3S7+gxwQDJxNTAbgZyJ+b02BzBgwjGwT2QoGgujKaSU2l577gO+8DvTwdywQhze4eTp+2Eqm
	wL6ATXI6/IL4N30nDbUtTdIIQRaiOgNzJXaS1bmWj3FH1KvqOFTUr1I3VWOOvVQS7HzLQRbeCdJ
	+8xwc5AeTZLNVizbp9qHEY9i5SwWJ4QZ8Yq1bE4u7YcCmpbM6tF/DJsguoPugpISJZr7UU31oVx
	2fUNJ6elmoxUBx+8VvIYEuYEVSGtLhxEUhHhPRn6xe62d62H5e4kaxglS0wAmIJ3X4NeLfYFf3Z
	bK9StfIAlP+Be2mxpW+7X1IUe2v7p+9wu2+0oaqn7l6WrEi/r1A6d76vJNn+2Q0GsfLkUB3Mq5b
	EM9faWa1YzG1xJQxHNt6OALU4iVuHdsA==
X-Received: by 2002:a05:6830:675d:b0:85d:44ee:607d with SMTP id 46e09a7af769-85d44ee62b0mr4891932a34.0.1793630562723;
        Mon, 02 Nov 2026 06:42:42 -0800 (PST)
Received: from bill-the-cat (fixed-189-203-100-56.totalplay.net. [189.203.100.56])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d351e841fsm10105380a34.1.2026.11.02.06.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:42:42 -0800 (PST)
Date: Mon, 2 Nov 2026 08:42:40 -0600
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.u-boot-project.org, linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Christian Ratzenhofer <christian.ratzenhofer@cdnm.at>
Subject: Re: Pull request: u-boot-sunxi/master for 2027.01
Message-ID: <20261102144240.GS3309461@bill-the-cat>
References: <20261102114733.3468703-1-andre.przywara@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fCsZTOytPRR8dOnY"
Content-Disposition: inline
In-Reply-To: <20261102114733.3468703-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--fCsZTOytPRR8dOnY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2026 at 12:47:33PM +0100, Andre Przywara wrote:

> Hi Tom,
>=20
> please pull these sunxi changes into main. Please note that's the master
> branch on the remote side, the main branch is immutable, so I couldn't
> push a fix there again.

Ah. On that note, I think the answer is you should start using a branch
name (for-tom, whatever) or tag, rather than just pushing to "main" or
"next".

> Not much to report here, some cleanup for some older V3 SoCs, also a PMIC
> fix for some Olimex A20 board.
> H6 boards with 3GB of DRAM now work again, and the A133 build process gets
> adjusted to the now mainlined TF-A support.
>=20
> There are bigger changes lined up, but they depend on DT bindings which
> have not been merged to the kernel repo yet.
>=20
> Gitlab CI timed out, but worked fine until then.

Ah, I thought I had adjusted everyones projects to have 2h be the
timeout, but I see I missed at least u-boot-sunxi, I've fixed that now.

--=20
Tom

--fCsZTOytPRR8dOnY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCauihYAAKCRAr4qD1Cr/k
CtgqAQDg3+DZlSr8oX3TPv8QhlQCcMn7cGLUWG8uFVALrpy9wQEA1VZjYbHyjDnG
S03cs3Rvh8k+gm5H6LNn/6h6eAUpSw4=
=Vy6p
-----END PGP SIGNATURE-----

--fCsZTOytPRR8dOnY--
