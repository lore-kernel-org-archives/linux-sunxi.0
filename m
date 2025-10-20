Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F136C2FB
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 15:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760973647; cv=none; b=rhgvfRBMWmZmOTQ1+h02xeKRSe1vQDcDLFTo1Y4qBcY2Zga4BRRl4n+LvJ6NZdOO0yHjYdN5P8r8QdnhIOxevCIScO6Mkc1CnNA9Jp6Pk0AzPkzwFCPsIujHpdAMlIswWVVokfFkJlFCquvgouDSCIcXGaX5PT2wiYtBThUC0VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760973647; c=relaxed/simple;
	bh=GteNF7tzIOEqgoF/L+YflncxNMHTrZdD5d8VsX6JS4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BJ7RAhLcyzw17zF8qRwXmrAhzVYrEty2TcuR3K6CdsG0SEoe9bT4nge0/pLEVGAGJiEc7KrQNNjK/S++XPg+AdU7IC2LSDhHUM+sxThSirBTRYqVS7C0pB0QKD8Qt45Amn9UT3G7gWeVdlQGGW8+SJBdgKVf1oJkEJRfOJjpako=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nE5uWF3g; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nE5uWF3g"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47106fc51faso53066055e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 08:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760973644; x=1761578444; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GteNF7tzIOEqgoF/L+YflncxNMHTrZdD5d8VsX6JS4E=;
        b=nE5uWF3gYHxPS8sYrWehhFCSmlpLxo01TFXWZN+191u233MGDJRc80XtmEbmD3QOOf
         HAWgkLssPoahPgIaVL3zk5fBY/18Ni7UpX+80N+6O+CBi918YXz1hzylU81A9iezZo5f
         i9qu+l2cCp8+lH+uKazSaIOenGH4/l1sDKuxeDz76KgL+y4DPKSEOYxQ87rlinMTcu5Y
         wlkRmuNfVawyKhZ+4Tx3wtFFfaAhklQRSrhKPIgV+VRCfrRcGjh0jPlTpUPcj1+honmW
         OWUx5t+Q3ufSbk3Sh+edvfNp4xPRt/rTAfCH+0VJI3sw6TrOTi2DXUn1sK6PE0eQmS9W
         OtwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760973644; x=1761578444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GteNF7tzIOEqgoF/L+YflncxNMHTrZdD5d8VsX6JS4E=;
        b=Eg8IZDPTyVxB9Wm/3pZuIaP64wSFzo+cFSyAWW6Bo+WYlpT/4mOm9MJEsbH8u/af2O
         JH7qDzXDn7uLjhyfTpIhFPAAh1y85hUEpzIeKsyEAszIPPVuBc1szlqXvDj+apzk8/Kj
         XeLlTHSY7CXBXTHZCKpb79r6EaPzKGrE/WDa5xJaGCE+rb7H2egpKplPeTJlQqiGPxj7
         7jQldFx0UVcm+OrXHoDMMWggCBXLiq3cK4x4x4vrvN/x1uAvkRkJhsaPH1VPeugfS/+3
         1lF/La8mBS0W/8xOsK7sk6MHxl1tND0TY9MJ1PdiGwgFjZTH4MmRqVavmBO3SFcXo7J5
         QwHg==
X-Gm-Message-State: AOJu0YxMzIAHyNImI4AsgsHyVMGq98I0HknqLfaXy4nCMxldmYgmD+n1
	L3/kISDVN4MfuQXwb2KZrGvukb4uGrodkgod8w6yFd2SNj+EsjEO9wj0
X-Gm-Gg: ASbGncsdohHeoO8DcizM8zKr8tiu/fvHcM0EQjERfkHqDsetfW4x/S7i7uiMr8RF8eV
	kTXlMqEFGVxhh/t2cZLlHRBk1BVcQkDhjHne6xVjlguSkD7w1Yj7i+l9S+fUv10PjEd9eYd4Dlf
	QJZxTd/93TtlMxWScPA89r8xso1sLZs/wlwtsC+MPE5PXununaAuA5HM5lQLvuwnHsw82Pyb5dJ
	ubbZOrRzq0FqCv1Wt5PKiYOjx5a7qdUwOP33JCGvk6ETe3hNTFW2ZbEo7Zte+hyqvLIzG7ivJth
	K2SQ+/1JNxxfhAcHQyWNTbdzehtUS/PiYsi0V7XSU5wHflw5eXcMVY2mZy0nx62aM+ZqYBQ5aSD
	ZER6JxIXpIL00c0Y8EqeBsZCiNwQdZFcf9I2GkVLYGZ4Ik2Lmb0b/XWKpzImgaemNRsSNd611dR
	v3cmFAZtky/tCAn+kBVLJGwuYOgIySmyhrCxV3VM6PTaCtk5FEqhm3tC+/ZYrFXrCImqRZ
X-Google-Smtp-Source: AGHT+IEFMj+0Aqv0uMo17I5lr1LLsfg0Pahecr509ibKNpJV31Ik//CmchiG9+H4Ll+VZU8YWaO9Ww==
X-Received: by 2002:a05:6000:40db:b0:427:8fe:435f with SMTP id ffacd0b85a97d-42708fe453cmr7286977f8f.57.1760973643606;
        Mon, 20 Oct 2025 08:20:43 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a9a9sm16321753f8f.29.2025.10.20.08.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 08:20:43 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: u-boot@lists.denx.de, Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev, Mikhail Kalashnikov <iuncuim@gmail.com>
Subject: Re: [PATCH] sunxi: a523: Re-use H6/H616 DRAM size detection method
Date: Mon, 20 Oct 2025 17:20:42 +0200
Message-ID: <2384364.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20251020142622.1849108-1-andre.przywara@arm.com>
References: <20251020142622.1849108-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 20. oktober 2025 ob 16:26:22 Srednjeevropski poletni =C4=8D=
as je Andre Przywara napisal(a):
> The H6 and H616 DRAM initialisation code recently gained a joint and
> improved size detection routine, which helped to avoid the occasional
> DRAM size misdetection.
>=20
> Use the same code for the A523 DRAM initialisation as well, which
> suffers from the same misdetection at times.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

I was a bit perplexed why code size detection doesn't work right with
current master branch. This explains everything.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


