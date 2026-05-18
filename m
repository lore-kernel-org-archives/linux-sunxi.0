Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFD731F9A1
	for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 11:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779103799; cv=none; b=gObLNDgoEUprkzAxMz5IDmy4Cy4FfRjj+awh/kwVEL+r+ecIjdkJlvqKDcBVvaUTlviLwnK518DIwa2XxnY9B1UXRX0HaK2nSbgjRFIttwPxwJzYJm6LqIMdqmkMKMfz8Tm1E8iB7Q5a/nDbOLVLkQaeXVMqYiEwwx+ChD46aaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779103799; c=relaxed/simple;
	bh=Hcf2oqn9+1oTrvHZKQuLXActXOhO6WFTaxZkBm9KmB0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jtcLtIbcYlsw6PD0DAK0ShS9iBRzhc37KxSFp7dFAzN7Tr1M5M8qyu2Y3quXZoPBjRbch/tVuxuh6hpxz1lNo+24uvziWXXn0ePXA3QQWBtmGEvE7adSoq496QqlPyCIldeLhK/B7zBr85odAfgSJ1C1KV4MBxMvR3Nh+tMbZ3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ico0ZNT8; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ico0ZNT8"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48896199cbaso16900125e9.1
        for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 04:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779103794; x=1779708594; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Hcf2oqn9+1oTrvHZKQuLXActXOhO6WFTaxZkBm9KmB0=;
        b=ico0ZNT8JRZAtXk6aef1ZdDcVUkKbv7M9ncbxbzX2EIeYcegWldZsaURG/xXy62woQ
         PX+SIIcV8LrqZkjEBJ9L2IMSVq5ZphAxmgholw96JLvtffADixOfBAV027yCT98c0nxn
         3PCMqRjmaa8a9nV+suhstCtcJbo5FUlxeX41t18ecxGceIh9M45eVqmpRW8+SP8r6MTx
         bS4WU44uMFNVszKNZiWecI8lpMKEA7MkrT9/L9bDsdP3nIVULgp2CTh5Dp7c80uWZcwI
         KPMRhAF0qJD/oKROvDnssZIU/lNdPJmyl7t7I6u16qdH4E8YaYfcNTep5Zu0dSKuy3Tr
         zrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779103794; x=1779708594;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hcf2oqn9+1oTrvHZKQuLXActXOhO6WFTaxZkBm9KmB0=;
        b=Dqwj+cw7G44x01103g0VzMM8EJtNI+hY7YnhHetMYB5t3FHNGbZkt6MQP+9ECoPW23
         K9gMTQ4c1DGzMugJL2BH+kGWz7W/YByKeokBuoCCEc4QYn2LZP4Aou14bo6AU7ZtNlgk
         VaW1UicYjxoPLdKlwuJMFynAIlnsPQmRIUVMZK9BOrEiMi/MO3ez+Tp7jp7KJ7E6DEcP
         9qOxlP/5FCwIePEBL3ougeZlIN/OGAgnR7ByH+pNaLXFSTLr/7VaEQYIXSrosZr+0fw1
         hiqEyInkl3LZ4FrLzfcw5MF2tVZpADtpruxXsPyHW2fhLk8yfTq3cIFSjCZPQ+2D/BdQ
         zctw==
X-Forwarded-Encrypted: i=1; AFNElJ/NZpVITXQHr5YfQoAGVLdnExpdM80jlvRP3818CRUSgJF/IIQlGZG6MTtLOmslcCPcrHVA4YpM4O5ufg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwAa09hMoa9z4eHZL7mq27eka6uWiOHSzbbUu4U4tJ3ZHwQbEPA
	DtzNuE4q6YsLrTM7k0Q8Q/IEHaIQnoVENCSZJ3IDVx5uiLSSq9mp8q/U
X-Gm-Gg: Acq92OHUtjgFAWc+XF+e37SwKBgVkJZJWsEaZQGuinDnm/v7ynNbsZom9ZPEMSdMU9c
	Za6uOjK9zjn/3CJsR87zNnPzO2FeV4/qDG1ySQkc+Y6PTRRA36qFpzBBp4v1C3KntKJhNMHOWnp
	caMXVz7XNiAZzq07DAIJuLVQyf8UiVqD6EB2XwacV1yDAyyQjbHFbG3LI4B83n3EZ0ZQXaaq17r
	V3eU9S8EH7e+IMpgXz7W0a9MBcihOZYjLRzmeWpXOLcaznUMZQ3/jx+wCEw7CGmIFSIaFcbFYcp
	f2U2jE02p5CvFOvfrYp/mkll5b9x4XRwmcMO+CwsW7ZW+Z9H/6XvdqTfQP8O2M2EtWmzZL0raWK
	Y+J82o82ICnhJAXF8IUv1GfazUxMX6Fz1s9Vtw2vqc3o2iQ0qx1D5ALbsjdQCmlMHNEeiHIwaa7
	nElRvoZPevr+opmCmCNMsJ73gjKmh4N1QVOjmOe6CC7y333ED6PHvCVpfujzedQhvALFYraVpvB
	S8=
X-Received: by 2002:a05:600c:8184:b0:48f:d1b8:9aa5 with SMTP id 5b1f17b1804b1-48fe60ecd7dmr220286485e9.8.1779103793402;
        Mon, 18 May 2026 04:29:53 -0700 (PDT)
Received: from giga-mm-11.home (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00e5easm80885505e9.13.2026.05.18.04.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 04:29:52 -0700 (PDT)
Message-ID: <6d8659f393e0bb4f0805107a17e306422982247c.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 13:29:51 +0200
In-Reply-To: <256b1cd8-b143-4f71-91cc-8513be04ce4c@arm.com>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
	 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
	 <2306dd3c-6362-40ee-8d9f-77f89be3a502@arm.com>
	 <14a7e289ff5ffed8fcd6dcb9b2e8455a1b2c9420.camel@gmail.com>
	 <256b1cd8-b143-4f71-91cc-8513be04ce4c@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Andre,

On Mon, 2026-05-18 at 13:16 +0200, Andre Przywara wrote:
> > > And anyway, I see a *dual* USB-A socket on the pictures online, in
> > > addition to the USB-OTG port. So where does the third USB come from? =
The
> > > A133 only supports one host USB port plus the one OTG port. So is the=
re
> > > an USB hub chip on the board?
> >=20
> > There are two hubs, one on each usbphy. OTG side hub is even bus-powere=
d,
>=20
> What do you mean with OTG side hub, exactly? Is there a hub on USB0? How=
=20
> does this work, then?

the upstream port of this hub is wired to the USB-C connector, one port has
CH340E USB-UART on it for the console, the other port goes to the SoC usbph=
y 0.
So it would be "peripheral" only, I suppose.

--=20
Alexander Sverdlin.
