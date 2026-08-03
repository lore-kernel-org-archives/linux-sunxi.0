Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E7F2F7445
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 18:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785780221; cv=pass; b=L4Z8t1cgZwelJHy4GIomcFUFky6dUgWRl7mfmO1AYpWep5SNTUJG42KZcFQ8ni0tjbbVzfx7YnWI1fA0KdJ9EkPMD0vXHSEshkMerDyZudu0O/nyA3+ult+RdRb542y/DwTurUe/tGkOm/G9DIVzfY7YExfgTFDRCg++rnE2rtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785780221; c=relaxed/simple;
	bh=ACfuI3AX9kRQ1+CBBBf5za/2rVC3FsYXI8omco7jK4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a/K16t8cykR6VXhIhckYQIrxiqNyvPvKjltdyYivEkp6gBcR9KqWtcCbpJ9b+22bFaEmEq338AtY+S5uzDq23Rt80U/x3TzOrrAGXhST6Et2Na3zLVrGpC0Eg33nzkM/zfFo+QEaL7Eh17u12B6Lq5di+jX1Duz79P+QsbzjGoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VCp/Bzwl; arc=pass smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VCp/Bzwl"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-74ab99038afso2287142137.3
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 11:03:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785780218; cv=none;
        d=google.com; s=arc-20260327;
        b=nmNwSqHDg2mteDCmbuaQQI/lELKDetxOFECrrMQuTZ5prvUwpfa3X/o9MitN/gdW10
         e5mdyWSh12G5TuBGHHJM4wUTECBK3e+8qwIIOQ0vndH4uvCmt/2lpcApG2nyznFwFWyb
         zPrJI0dR5zYul4JbdVskDXjhE4p80T9Za8SWhY6O/u3xkdTDISd5+D0dmCZ8QAz6sCn8
         X+Q3yHHw7KVg022NaEqswg9FcOH+213gPJxt5dqTSEhFdQtgxfUsogeZNQ72a60FglPd
         0v90ZKiIp5Y96taRMqyIuyCa0tubeYbpId263cYMeteM6NftC/z9esaY7bEUIwt3nRxm
         wtXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2r8t0fZLO1G1B7jNQrzEMX2EdERqWbCFEmueS3AzIlQ=;
        fh=FwbM3tGVAO8fw4a3lfP/HGDV0mIHNbqP/Jksjc0Pjfk=;
        b=Bc5K2eiQiz8fzLCm+i0czJ/RqTAGoY9EeWggq2UYLXwsIJ1xeMB0jDcul/J2F1WLSX
         Y1ggGhRQiMlMW/IqNSIxA3VR8Z/x9mb11hxv1tjoqyn4GhU41vBoLP3aamseGoOx9bsw
         Xk7CyNhUVVz8kxIzQFhsrudfeHgQdECfZhSoo1HF3N+ZPMRSjtzIagYIO9gJKW/BxbpJ
         PSd63HfuW6GmTHW2XUunyKRQ1HommqwsYetcorVlYJqprpHsW2KsGt/m/bj3YW1L59vW
         wO/3JvQ1ghqPeQtzDVEwkhADwcLdr7sKPYvIb9TSwTv/CkvDP4StMPIgMGB40V/WjLmh
         +6Sg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785780218; x=1786385018; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2r8t0fZLO1G1B7jNQrzEMX2EdERqWbCFEmueS3AzIlQ=;
        b=VCp/BzwlGln4VGDvZpnsQSPp9/OiY9dy5zhxeVjUtPSfOF9+fGXnUYaenCGyEXf8Wq
         XArLCoFO6vl0R8xT7BQYbiON5GPFI3UjkgcJ3xOaXNCEbWclv6CWgeOugkfERO9ffeF0
         9rtVGrTOHb9OjJVbQxy5A3BNdbQ17FHq6gtaMEFiaW9gRbo4iHDmTmz5j+PsLi6p/cy1
         e3beH56Q3yOEbZACBYUha/B1bgCQrsJWDwjqaYmxs9EiaXUIJWyOHm0cfoc6PxPFRgwv
         L6XaJedGbrx0okJNRqOT0lMNqSGTQMgZHOm5LvKi/50hfe96xFIzXRxeppMPSX0lU6Ji
         L0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785780218; x=1786385018;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2r8t0fZLO1G1B7jNQrzEMX2EdERqWbCFEmueS3AzIlQ=;
        b=lNaS91lrX9eJbZnNXsEjPhPFYBFiIkBdpAihUJlAmSGPlIXlBI/vTw1PaYCZvwxvwR
         zKvEr+YHDvvGeBqm4AnKWI/wn6N59oKCE73eDy0ufEshfokzz2/X0mPGlbDodby08Kfb
         R49qOAHIHkVshi1PBPB7EkspG+TkeFdzOeCzkP0h7bqIplUDhPbG0UfbLHt4DAOfIJwD
         pjgexnu9mD71mZcWtl8sKDh53YGRZtBQeVeMrekQ0UWMLdCBL6BNspRd6irvWTfTuqSh
         /aZrGLPETUiRzXt4HvbVvF/ZfS9h7vtKSZIf+6HQ8cxQkUiOam+grq7XV2somSS/Ko/k
         54PQ==
X-Forwarded-Encrypted: i=1; AHgh+RozbknNADbs9J3Wt4NbM9L1Pnk+nve+pd7A8J1jEXH4+ZfIrlxmhbLsizWOZ36YqeSH8tY+yMGVNsv6zg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyfTrnMB20Wsg0zzL+nfQSK9lr/6Xh+FT/jK0SqL30AbWQq1bei
	KpoVUpa6EKdsbKA/W3cEQ1kNculTI9QoGrQLK6JEJKn8Mnw8rnDx5QmQ6wevQjSOHOgF8KeiM0k
	dpQzKGbdav1s6PsUIn/q1nPUtQXZH48c=
X-Gm-Gg: AR+sD12XUQL1CTRQBIodX2o/BmZPQ8gezUvpwjf7WnuqCVCZ3gWfMjQvHtjIYXdjlfD
	cmE/3JV6LvRXflqF53n84roY9QqTmLxBOfqCZc0Gkbx8pzBXZrI3mYGqr/YHDdP4z8H/FWbN3Di
	Wd3vfCL/q5eBGYjUKJCpzSi6RvuNqNmcUvFMkTcnKefCAALH3dzIlghQ9z9pt4AVEfAfgiX5wW7
	ruiUSuIG4+Bf11xcdKI4RvUA2Tf21M/kZ9JPTim3bIIEQYWlG5nKbdWtMQwijCCTPuu7HQ/EYan
	c9BVRmn2jSAlnbzXk+n7qONm4GoE+XL/EPXEOIwCJMp8ousD3FSdVHsn41Ow9uA94LBid+yRBvW
	e5dtTYx+YENsF7D65zasd22QOYdioXZc1yp26DnfG6kktWRy3ZzAnYZUXFPYXglzSo9SRWuBZ7y
	gf31lmZb1Bi+DJVh4DMmWdf5ub3Ly+E3nM5teyBvB/8yMclqoY
X-Received: by 2002:a05:6102:6899:b0:726:8813:2085 with SMTP id
 ada2fe7eead31-75b23d6e2d3mr8230898137.13.1785780218392; Mon, 03 Aug 2026
 11:03:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-7-0a53cd9e21cc@gmail.com> <2979768f-4f83-4f28-ace3-826f4b4c6844@lunn.ch>
In-Reply-To: <2979768f-4f83-4f28-ace3-826f4b4c6844@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 12:03:27 -0600
X-Gm-Features: AUfX_mybO2gp37G6C7TCuAPmk0gNUYqtWf9KEEokxzjK6lix8AMcIQeuj4MOO0w
Message-ID: <CADvTj4prV688JDR-QAuNd+jTVFyE9aicRaciqq0M6sB0V2GiXQ@mail.gmail.com>
Subject: Re: [PATCH 07/21] dt-bindings: net: x-powers: add AC200 EPHY control
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 7:40=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +  phy-mode:
> > +    enum:
> > +      - mii
> > +      - rmii
>
> Despite the phy- bit, phy-mode is a MAC property, it defines the MII
> the MAC uses. I would not expect to see this anywhere else.
>
> The PHY driver is told what MII to use, phydev->interface, which takes
> the values PHY_INTERFACE_MODE_RMII, PHY_INTERFACE_MODE_MII etc.
>
> Please explain why you need this here, why is the MAC nodes phy-mode
> property not sufficient.

I have reworked this for v2. The phy-mode properties will be removed from
both control bindings and their DT nodes, leaving the MAC node as the sole
source of the interface mode. The PHY driver instead passes
phydev->interface to the selected control provider.

There is one ordering complication: the control block must be powered befor=
e
the Clause 22 PHY identification registers become accessible, which happens
before a MAC has attached. Early discovery therefore uses the hardware's
reset-default MII mode.

For v2, I split the provider interface into separate power_on() and
set_interface() operations. Once the MAC has supplied phydev->interface, th=
e
PHY reset path calls set_interface(). If the provider is already powered,
this changes only the RMII_SEL bit; the normal phylib soft reset then
completes the handoff. It does not repeat the full control-block power and
reset sequence.

>
>     Andrew
