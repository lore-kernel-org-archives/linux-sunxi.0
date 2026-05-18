Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C880A34DCE0
	for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 14:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779115216; cv=none; b=bq2/vatUYRmWxr4/c69DbeeG4rgGCUgmvqMpotZL3GA5K7Z4r7tzwjgvjtqf9rEM0l5xtG9Nd7gK6Hi8nP5aDrXynTj31/OWKp86SW2LfEteoGYJH6TtLuyTESdXdGfRhmr29Eb0ni6phZ9p5HJbLA8l6FEvlmI82pEFaPp66WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779115216; c=relaxed/simple;
	bh=S4c2AULgCr+oAYdflJy/tl/FD0zXRMyuMjKCi/X55po=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=POnl1BqIMysiz8xbxLemTBIkYrxc1SA9DeL7+QWNi4bf0+NI+uflvUxNYV5+kFRi88DeUrt6PAsF/XD894uZYPJxLR3+/7m+4FI96IGhnp5WsKtl+7OTOXfqMVmPfg035Afi3d33eoEy+GM5GloOqrvtk5jOJU4Wo43QwlVpe8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FWaDoNWm; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FWaDoNWm"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so28560405e9.2
        for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 07:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779115213; x=1779720013; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S4c2AULgCr+oAYdflJy/tl/FD0zXRMyuMjKCi/X55po=;
        b=FWaDoNWmO6XWB2ETVayocc+293KRres/FYt4ifiB7KkSFxwO0GRCAnYXaDqgPrWf+1
         p3A0LkcogL9ScdMuyGXcP8HvUH3HUQQtJCgIt1imtReSpHQGXI4oDMkEjPebagr8YeRZ
         vCK9pRUhtEYoOQUYAAqHmMypTot+9mThhBl8g7zTDkQhfMuusY2lfealoxFg+AqTeghV
         hgTFjTqHLfImKsy2zbSfyDEKD3tHLzSpq5T3/MFGzWodrxcRYHvIyYNHdGaAFJsAgkXu
         TBA4h8cu3VuuUKX3rTyXEHnn7DsaoE8wQz8KtMCPo0ixuRfwqW7M1XHD8LG6s+Xs4hiY
         u45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779115213; x=1779720013;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S4c2AULgCr+oAYdflJy/tl/FD0zXRMyuMjKCi/X55po=;
        b=lgb9yrj/i6SFwqYceevvm7eXWQygTzHJ81pTXtvsA/maGfy5KIqPdqSEgjTtmOtWOo
         f6y7bz4tl8Y9cd91P0iFq7mWVUj8aOZpH6wqasEeWm0Q908VuLeZkHfsfUkPcJXSB7MP
         SfdS8pKTYCTlc+kbHFsOukbliB7NSnpVgg2GVtO/ExJ3x2/jK75zVzaC7aEdCmYeqtl9
         eYQLgeOCl40iJZH8Jk2PM22Fp0Em7W5sJcsR4YlT+R5h59H6i0eOPX6NUFzdERZK/fpG
         Z+vNoLbTIjhM6+D40tzlqpaXx2w9/0caGroIuzM6nhy58Pi9U1trnVNLqw2Jjuont0c1
         4tFg==
X-Gm-Message-State: AOJu0YzjqthNX6jVwwRf4fpXxy1eR3L03j7/kHKnKXOzabymmw8GPx11
	OlcOPWAajUwMONqOBYo3ecQe596Rk3mVcnAYmIFLuJXGWEmMN+vCalfJ
X-Gm-Gg: Acq92OH1eljlXGFXcQtZvxenI+n4aOAuDo8ALZhkXh8gpA9HKX1LDbODG4MNxOg8Z/b
	5IiRNrexokFtyyqMzjArFxnlV7AqyjpBTY+2VjWdvPBr6vVsQPOVXhlRfJWeTLOZeduMFnxkeTF
	gHaRcBz6JuiSzArIoLLJYDO6Wmm4JKG5nw6SL5pagnNbnE95z+twhPm1KeXwg23s8XFxe0ZPt4K
	hrWQ3AO2Frtm0/aOmqdO5Y67KNAh8GGZ+5GjZTyVRH4SoHpn6jKW92E/b+FnMffOa+rVQZ4+Ijn
	9Dt8rXWodCWiU534okotEJ0pKCrGIkDfruVNH0zwMGkX9DEpYKIeFVsvOSoROeKK7MZGHKiHQ5/
	OhjFosGrS424+JokXNaNrs4u66O1oqzex6GokDCpP4fE2jxcIL0hezimMFYamqhZyV+fbkcPQ72
	IuVhccjVnKqFKwqp82K3HXVORO0dtbFVwArXNw0500GuCBTYJliSeQgwRP2tJ6sx4KA2HmPLGla
	9Y=
X-Received: by 2002:a05:600c:c087:b0:48a:7b55:12a6 with SMTP id 5b1f17b1804b1-48fe5cb36aamr189623285e9.0.1779115213181;
        Mon, 18 May 2026 07:40:13 -0700 (PDT)
Received: from giga-mm-11.home (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5e9d5d9sm303576575e9.15.2026.05.18.07.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:40:12 -0700 (PDT)
Message-ID: <bc3b786313adee30cc00c65ea98ff5258a816abb.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 16:40:11 +0200
In-Reply-To: <agsezxcxjQlBmesm@collins>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
	 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
	 <agr9m_tidBr6Cu2h@collins>
	 <579c7c33123c4cd0bd486301e56daf5962ca55ec.camel@gmail.com>
	 <agsezxcxjQlBmesm@collins>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Paul,

On Mon, 2026-05-18 at 16:14 +0200, Paul Kocialkowski wrote:
> I also have a U-Boot config ready for it, which I could send once the
> device-trees are merged on the kernel side. I could send it to you if
> you're interested.

I do have one as well, I'm testing all open-source ;-) from ATF-upwards,
just thought U-Boot would require ATF merged and kernel DT merged
because of OF_UPSTREAM in U-Boot. But I'd be happy to sync when we get
there.

--=20
Alexander Sverdlin.
