Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B763F99F3
	for <linux-sunxi@lists.linux.dev>; Tue, 25 Aug 2026 10:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787654709; cv=pass; b=ia0pYCVeJQi9SSPEqZVj0pLNRwWejlPdpSuqSW3X2ucOPi0ILnOifkWNsbNBX3V+95R2Zbvdz9uc2X/ZPHHpL0pLqX4Z70V75gcOUviHOONXCZ+j2yB79Qvcnh0KhW9T7pnzCzfiY1z7k8+Zl5m4+hzXxPwo9sdBCXc4YNCW3pU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787654709; c=relaxed/simple;
	bh=b7tRcxQ9uqlAYxU73ScNDdxC2wVeUQWIqGoczNzFSXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S9QVD0Cp838GWO8tFWhNZ7xteykYubuH232oLp6bWsLxIjZhENgZTZ42CRVeUV7z4eZilQ8I/BxnALElrirw6UI9IxbAmmNW9WKyRehMlXdV5bUL3yb0J+QjVggHqPHYZZkEAv6z6B+JFbaTzDR3Uls6fegeNuLZsYlZeIApPsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q+hxVrwV; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+hxVrwV"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e347638adso4353237a91.0
        for <linux-sunxi@lists.linux.dev>; Tue, 25 Aug 2026 03:45:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787654707; cv=none;
        d=google.com; s=arc-20260327;
        b=mPe1EtfIkIry1ysvKNVnfSLwfSlmW9GSMM6bi8An3ZDr/MHY2CRKMhStK/ep/UIYNs
         GPJwO5dOBjs5g615mEoaxgdvnwqJXGtY2rOug3feFWec1rFdQVJrmHsCPy15Hh6+vBxT
         riSV5mKjB63qWxaiZzrGW6KsjEuEelLUg+L1YoCGihjW1WEcjBLrjnh+MK770OL5euze
         5ztAB2PKWbTWdEFLI+hulUpDLY7FTZedkqFUmee3BRU8sp4C4QOnY4LahP5RHQSxQZHs
         6vdYJmpuW/JjUu4qcfctEKcFmAdHvPFzMAo81gNtPYUrNlgZLgXwlH4H6iBVa9yFmd68
         uhXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=b7tRcxQ9uqlAYxU73ScNDdxC2wVeUQWIqGoczNzFSXg=;
        fh=BMI3NLJMccSyRuyKknYwtD5xEK9K346VTU01EF36s0Y=;
        b=T2PMQosSP2NQJ0a6y7NtazbLuM05PBZ7piqn/NTh7EZNJtgNuipqlhoAGZ2d7Ac06b
         35cem6+lIsbD/wCWj9KfT1fLZ9JIobxRKoB/N6AKNvpZX7Vaw3cg8mNFmyDzGImaur29
         1l72i/tQgZgpaG4A6Miwre6jbH0LJSCBkVF1hHTLd0/5jILC+ebAJpQqhAebKEuWBwXX
         1+Zfo/ToQFvOblP509F/3ABhjf7L56FE0CQq/VSx4qZrmRLShqB7fYHY2f2hccA8oG6g
         nCdmiZFObIX9sWdLzCgv0KGdNJ2zw7CGSOJvHphbPxzfp1yOKPcy6q1/0dfJig4wm+4f
         7+4A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787654707; x=1788259507; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b7tRcxQ9uqlAYxU73ScNDdxC2wVeUQWIqGoczNzFSXg=;
        b=Q+hxVrwVLmnGCVJTZf46pVGOSGBTnhhB39hTMbd1CVc/tyx1GiQYSiiJu2G9J7231R
         TOtWSYDGiHkiFjW4k945mR1p4Jws7da2xulVtmvmmvf7tI3XjX7NDkUB2ACz3E2hr1nH
         ai0goHZcfYJC457W/zxE8Q9FrQMAtTdzlFS0so9GSwf7tpO99tBKeWKZyRStYGhGcohY
         7Tg8qEtH3zsysrO6QxnXBvfHCyMAeC4LFnAAb8Bzcm8cutBat2HT2oYPJ3DodK7EsIeZ
         92/POocvKDTK8QMzflbrNq8g32+58qZc1Ze1RS4CuLEy3x9XoylEtrjoF8BpVO2TI+rh
         jN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787654707; x=1788259507;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b7tRcxQ9uqlAYxU73ScNDdxC2wVeUQWIqGoczNzFSXg=;
        b=I52D6aq8gG4Dq6U/J04b29fP4HFjxWgch2BvVYM/h/EXI4gNLqzaFlTKLYx0ojca5g
         +pRyfmGlq7CI+cwZm6Q5kkMqteaMZr+W8u1VHirJgOQvctNGiFVBzskKnYU6k58XKNdJ
         pcAZmIFgIQ5HdjehXMMFyaQ7/pLCzS9BeiDrMOI8AJt5XaM+ZjXq6SZNu/dm0arcLoEi
         CHQCSvYmpz6FQW7vPdE1tb4KYdXlBVoos5Iq/UV2WNj2Uf7cm8/TTofZlJPAp7Burz09
         n03pUQiOu6i6vuQz6EMepfPcHOuWmsxYVbO3NANkrbmKX8IXFSvRRkfQm5PtAe+QdlQ6
         2N5A==
X-Forwarded-Encrypted: i=1; AHgh+Ro8YXb9CBDl4sbjiErbAN7GTbLAGAOi6lx4dsUtqxk8c1S9/8RvGV6qIlvEj1ZWX7Ac876LNt3aatFzQg==@lists.linux.dev
X-Gm-Message-State: AFuF++lfYaRq8Bs7zuO0JHSfAPMjWJnJxcwpp6rPpLwkpde/Pjwurkz7
	uSxFpMkkPl3aJl/GPz5kVh9ePR56Xnd/MU2scaCug08HcUd+csdNADm9tUoFftWLpGuEEkyIPHc
	bgE2rcY1Z60lT6NqMMwOHvU3dDz1Xg50=
X-Gm-Gg: AR+sD13mvEM3j9eDERmDq7N81/+Cy3PkzeIb89Fg8PTRnXOZefhK5B8FqmxMW/7Bbla
	RgnSD2xvCa9qvdbYehyjgdwm8H/6nsf0N9FGuMBrKM14HgVtF9sTKiOVFfdzYwApI2ri6Nq/j2M
	O7yT0t2CiXinPVApdvARXy5XbQmoLqlmAgjmZyYNtuu2u9Mp2Xco+gRDANNa7hHAqR1SUEtXl8o
	Mniq9Eyj8piogdPdVhTJSIQEGrHHt0YHUQiuL4o1vuYjviWfl4vU1Dp3eZ0PnuBmQs/zR8RFS0w
	+eVerD717qBY4huQar4gTO4vPcVJ0yI7fau+P/oH184WL207qgPQ3dVRbKeBv5i4pkv6XEqvoXf
	aqrUg4Rjk+y1LU/rK9yztBs2EARj5IRwz+HaYeYMMJd+PCRMXflwgsxhNevKT0kIXhrY=
X-Received: by 2002:a17:90b:3b48:b0:393:1cf4:d972 with SMTP id
 98e67ed59e1d1-395dee55f7emr43701740a91.3.1787654707353; Tue, 25 Aug 2026
 03:45:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260824100901.31675-1-phucduc.bui@gmail.com> <95b5fee4-70e8-4b2d-96fa-bce267ff13f5@arm.com>
In-Reply-To: <95b5fee4-70e8-4b2d-96fa-bce267ff13f5@arm.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 25 Aug 2026 17:44:55 +0700
X-Gm-Features: AcwNN1XpjoADkpBZBVR3Op1a_LHVleiZBaqWEnQq1TuYD8o94K4gAQB13ZUSpAM
Message-ID: <CAABR9nH0jv--f7nBSKy7RDapiCcr2BrZbOG=CVwMev15iBO01A@mail.gmail.com>
Subject: Re: [PATCH net] net: ethernet: sun4i-emac: Fix IRQ error handling
To: Andre Przywara <andre.przywara@arm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Linus Walleij <linusw@kernel.org>, Kees Cook <kees@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Stefan Roese <sr@denx.de>, Maxime Ripard <mripard@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andre,

Thank you for your review and the Reviewed-by tag.

>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
>

Best regards,
Phuc
