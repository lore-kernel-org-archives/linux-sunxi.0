Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794410609;
	b=Z83DUHY+zFGGBGDzpEtvtyaLpb3GqKa1Pxe7fszFoNALm8iOSU3HUtpE9z7hl2US3cs2
	 jyDIo1ECkteYNP/WKlRzpqS8p9GqzS5/XYO7+CnE82wuPLFnZgMHXzOLiiBlpyBd2Hd0A
	 yfEwIQUSY4WMUTmlJRhMxr5uyqpi60Zao6HaxiSHD15o5jGxQtNcZaoMGux3OsJ/7vkbS
	 yhVHFkeRpqyKRYXeB1UKeJElhki03KcZwgt8OyVJHwMyj/pEWj7CmxR6lcz9wbbyveTgg
	 XCSC3OHUORVRxyg4tmN0Ay0ier4rN07BhZCNzuf+IgKltMHSLHeKage3lfOBZKs39DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794410609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=lLACVBjihOslReI1ZuXqVZcPkVvfuAqXdIpebvhtflk=;
	b=Rf02SXgz/veOy5Chzbr/+epv7We4eV3Tydm8neO8laZiRz+6JJ/yLW8aNHoza0+dcDAJ
	 sZgrxdRDJjeEIB3MSe3zz3aMd+bxT1lhiFHAdPso4iWJ0EzxsrNkN91rfQFrGCOcNieS3
	 /lEyZE62ZCPCO1gMBkJYbk9PLKyUTy/9wp9MpIXj9Xa+xrAe/C2epHjdyh8fhELjYnAJf
	 udGN0BfPq+5oRPqpc8Gs781xQfUOXUjBAm8PZnwHWAKmlQHsXP1vOCvjUBX2VE0lFstMC
	 JvctPABJqOs/YwvAvTnL/4pdbjP2fSkAFWaUCytN1TITq3BwklTXIAz7TZ7pIZel0MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=offOqn5d;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE702606A332
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Nov 2026 15:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE702606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=offOqn5d
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b350d5fe3aso24547857b3.1
        for <linux-sunxi@lists.linux.dev>; Wed, 11 Nov 2026 07:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794410608; x=1795015408; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lLACVBjihOslReI1ZuXqVZcPkVvfuAqXdIpebvhtflk=;
        b=offOqn5dSsdFgFqTRmTdNqhEmfZioThGu12UyQpoFwnLq3GQQthMy/0rmxsFU1sk4K
         I535ZOPpwVHO+zcNQd1XsUN2JziY6Kt3RQBFrjgf4lEcQ8sB5sDEuNrxldYaTP1Khh1f
         9Mwub5YOuj9eDkz34lDrcs7/nNj9+3B3aFAj7qDNqgci9hNqI45svqexEYSuPJsjTFx+
         1tD2+3Aozk/6kXLxDjikeVxItkgkaho41YuZBQxs/rVIqvaUexQVZ2Eu20gp6P0HRmfo
         Pz9LjDFCLaW6JDJggjHHmNOyy7QHeqTGGMsJyPxAucMbw4hgvOUqVHnnWri5mZNz+90Q
         cFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794410608; x=1795015408;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lLACVBjihOslReI1ZuXqVZcPkVvfuAqXdIpebvhtflk=;
        b=PbclseiDviXgxtaPWDse0FuP1uvDmwNgLLFBqFrW5YoqnW4pxeUhKY19/NKXSIycuI
         zA6QCUtfoqPmJR+uOHvw77FwT8nfN1ri8kl8gAzGJKL8Ty22lXKt4EtYVO7apPdsiydb
         I+t+jBx/3VTBIeq3i+nGd+cBZvtY7YhbACwvceynBQGP/DUWIhRbZoWOshN7AE08DVqw
         Sc/wnG7AkxrpvhpJfHUM8SSUEPFIsG/vx4Oys4RADhX7cxh9vXKVloEvk9IqvDmK8z9l
         j4BJp0xpgnTR5ONP1JO6vnKnU9AaGIaER79jyKqhHwlC19R4EG8+ArlAqScqeprugxT2
         2VJQ==
X-Gm-Message-State: APuU4Z/QzPzMiNgDDdw9kPxe0srCt8ygPDhJHR7lYQWkYv9RH+Z3fUgy
	1VrQNN+QUox3QL9943hjVJovzdyoaKIpVQish4fZRBlXesEeE1X/mSQZ
X-Gm-Gg: AYBFou0UZClNcun29M6StKCT/4qtPCyEU5O9MUJ+o0ZrlEWFu4dXiHc0DSibkc7i7yc
	6UJCBASnldQR8ky1FD2EKTB7cKITcTRYx3qmQ3o+CaLfXycUvcHzaXWP959JXKrlzlG5F74s8jD
	wyc1X4T9moUVaZxyWZL2BxFaE/ksbcI5Tuz+rkx4qoVal1PM3hBAB36bGRDX34FROP1p2iIWgJp
	P45VTjps1jrZm2KpK8rcW5AOF1k7jSnOahE1eicFMKpkc0RfkYNDvvJiokQy2byKd9JiIoNmsoU
	VuqdZTHZ5aTXiPJhnbmfyqjwRSTWf+3oesS4xZ2Ra5rff6kEynS+edLlw+RFlFalaIJL7vvbC8v
	3StzZ2O5b9XTS/Vjbxs6NZSqnUHmbIJFfBQyGITX8XhEUWWEioeFy6sXoQLWdeeuloTusWK1F3b
	IvvbcfcJAmmghf1t/bKRN4n0sxHGkynwNe4Xxj2746e7PD5sK9aBWvYel3C3rl0zK60+DyXT9a/
	6FMW/Q2XGNdVLerJdyzaU72n9Fmu3sHc02ctSMlzIcubrf+4A5FO4BSGpvVJte+ozo75bDA7e97
	UPitsn8evVBwvbCkO+stC5wbCAUU0Ox7Ks8MFLpCpLiMbsPooihYrny1G5WYrFoxGK8kAbjCMiQ
	/5wNMD7VdxhSdn4sbd2XjvONE5rfnAD72xsaBwPlI+sZwIMGfkdrBbhYGIUtLoOb3WM/8ojfPZG
	5BDw1O8B57mggutytiOfCY
X-Received: by 2002:a05:690c:3343:b0:8b1:60a0:c311 with SMTP id 00721157ae682-8b3a8160e3emr20242057b3.33.1794410607746;
        Wed, 11 Nov 2026 07:23:27 -0800 (PST)
Received: from MaquinaLab.. (189.27.147.77.dynamic.adsl.gvt.net.br. [189.27.147.77])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b39343d4a6sm46621597b3.37.2026.11.11.07.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:23:27 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Yixun Lan <dlan@gentoo.org>
Cc: linux-sunxi@lists.linux.dev
Subject: Re: Allwinner T153 Linux CCU/reset support, is anyone working on it?
Date: Wed, 11 Nov 2026 12:23:07 -0300
Message-ID: <20261111152307.101401-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111121412-GYA44018@gentoo.org>
References: <20261109114602.49907-1-vinicius.eduardo.pedrosa@gmail.com> <20261111121412-GYA44018@gentoo.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/11/26 09:14, Yixun Lan wrote:
> Yes, I was working on T153, such as tools/u-boot/kernel, currently have some
> patches queued in my local repository [...]
> CCU/reset/pinctrl, up to gmac/ethernet and emmc.. [...]

Thanks for the update, Yixun.

Does your work also cover the R-CCU and RTC/LOSC clocks? If so, is
there another area of SoC infrastructure I could help with?

> I do plan to send some initial patches out for the v7.5 merge window,

I'd be happy to test your patches when my board arrives.

Thanks,
Vinicius
