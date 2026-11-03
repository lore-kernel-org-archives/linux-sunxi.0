Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793710791;
	b=xwzR6IZKJIj8WAJ4Pi1aTNjFMeHW2ZlG4bYadtg0fIyeWWB4FPN3GnV1JBU5lm2ECOkm
	 5SM1NHs78nnAUofrLhj9aGADgqDdeDiJ0/uFJO0OrrSuafTETN+wQF+FhoUQSsmW7tnjM
	 ybCaFU5ps2UIn8T7Z/geGgvSR+HxM+PyPL4esfJWAS2pCP7N/ouSIZHncTfTULNJikH7k
	 3WG8kQIhsHcc3Qvxm7bc3nOnerQj/lp7gV87GqYT9Ed2kdUKLxHvXFzM80aNlyC6hCOKQ
	 ePED0PK0VfS/0HXyrVNSsRxBoQXNgo5ZMzhhnYZtNzpecq1Tx+p/IwNOtUc04tmI3hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710791;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=rehtB/RJWCoBYXPyJu0f7lT3D0OaoNNCjHdpBYFEC34=;
	b=bFL3IK6ONEUmUlaF4WVMu+kiu+vQDTP0lyW2RXUyhdX2nhUpVdLdY+C9tmxcBHO2hK57
	 ymgR85USBQYa/rBirp6bncKxvaB+yPi+otJ55mdpzHCPw1+wczxpBXTrj7CTml+81dPa/
	 GdIMeFEvtI0/yCt05sd6pW0UJWEsTUCT2qwrbhjKXZEgxYcEA99Vz47AdOQYiq1bMBsKe
	 3MaPtX/bvq2PeSHUWFV3ZCq68hGenIOIqBC//qLBmMIWrrmuaWwGWqpfDaq3Of+LhO/dC
	 ro88Y6Y+apK93Wr8KFta5u8wkjgTWrtrcxROtCV+bhL4X96d5cGrRkSvkr8hTkYvE1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SGFa3fBq;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCDA606A327
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 12:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CCDA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SGFa3fBq
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b30477a320so1385937b3.1
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 04:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793710790; x=1794315590; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rehtB/RJWCoBYXPyJu0f7lT3D0OaoNNCjHdpBYFEC34=;
        b=SGFa3fBq1mifKl4EjDZF/+ANWV7OozXvzQ9fSQtmBA4mB1nSjkFclbSF6i0fpHyUXX
         pf6XZ3UQTwqAL+0PfHCNeAO7CW+n742oS/ZfblrkdavCNcUDs0u3ysKFon89DNc/wGhl
         DFVUkJUi/Qg5+7o+ksqAzm+wBWSKo6a/5lSVnYgmnIEdsS4FMYZ5oiaVe006+8QTiQvz
         B5/8IibghM5BXkjMeb0BzgWPiaL9sky6eJaBNkFS4frBETxZwT+VmYUcj/oJZfsicU0+
         4fOYROcr7cTS4sx9C4AdzBLQW72nRFF73E41XMMLZn+gzGFjl32XAaONcZ0Jl3HeD0K8
         lp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793710790; x=1794315590;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rehtB/RJWCoBYXPyJu0f7lT3D0OaoNNCjHdpBYFEC34=;
        b=giHjYEqaRCy1mWIamWTadk1yChI/bctufoij4ePPLNGOGzBd6m6zlmrGd+8evcf2lG
         /VaFbuf14NhZVoS2AmVolVh9UDLVJNyGNEONxyKHDFjdIV26fkUJNal48DN7laPY4uLR
         zjZSgTHgfaYp1kUMKhyk67Zpkq7/JTT8nZMX/5la7LNy6DPoXZiWpMakJBrwHOghkMmt
         gOxUiToHzAemeV5o1uwxlCfxnODQg7nkrwdCkOhQx7u2rzfXfd7XwJYdzVwO6J+48Moy
         yxKuRB8IBQqKv0w/HBLFIesoGYq1W6uyTIzF7qbVle9T4KQmxUb48CZLgKag/4AD4iBI
         alWA==
X-Forwarded-Encrypted: i=1; AKwUvBxS4TpVHDJFplHJyK/7/IW0R8YtUHrnw59pdvdsZKC8nQR4yVinkKp95oZeLoGcLlfr+9UHZYIFOULAjQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9SJaNVfQFAwTIG78pxSnAYxn5kwGWI1AT95EcnzxtrH5NfSFPI
	nPLYTgpTaWaFkdMalhaT6iy6OtdEw3Ilzb04hVUDLvMUqolrVaWIckrh
X-Gm-Gg: AYBFou2xdVSoS9Ok621FXf8OuUVSOa3/XcmIPyGtnHI7BLcLKGS+xeEGGRYUMeaTW1K
	UpR1m4K1OTkjAf6VTKt2RheYQCUuDDVG5jpHGrjI68awj/9t2RBu0s+JPkKf1DlqgkLyYljLDRW
	j8eg6l1xi1+ws9XDj7gXZQCFebQBb8zWa6XMfezuzEzXfmRIQT8trKc+oZyLb8dOu0Q4cqL8z7O
	VP46K/yMCzz5t9cVM4m1maGsBE6DUhNA+XZ3v+b3s6473QQzmU32lY95Ik9mmrTUi1AGYHdLd6N
	cfi5zC/Mata2QrJVR/ZGA/fAIyidzmpxN3g0uTv9JQsMkFYyYsOBNaJ2fMyOtqj5oY+vcg7nCdf
	MjPr8nSMx88AvJ97c0ljNK3tboJvtc+IiLIHyru+tu+mXdx1Cfwjv63QvGHr6lCMCuynVR2zBxl
	vtFjOBDlFjNEFK8F9eJAnjU/QPtm4Q9eVKQaxJ8L1olwqT1cemgcoN0YlimV08HmmgqUgZ+lLwf
	EybQu6LARPuy4ZGLqc7Gsd475SU7JYbHZggz2xlMBjqzEeV+Kxtpfi9zr0v2DRBdx0pPz79aNl/
	rTKU23wi+q5NwKBTrPSBb6ynX6Yqg2UvWAOoX9tvbbZFImYJFVTiTSjd6btSFGJbYAIKXDg0RqU
	FnmzjF9dutcaSi0wZjrmmmkosjzSbLz5EZvxf
X-Received: by 2002:a05:690e:d8a:b0:679:9b4c:5b95 with SMTP id 956f58d0204a3-67ba5049d99mr6926082d50.97.1793710790484;
        Tue, 03 Nov 2026 04:59:50 -0800 (PST)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b6d3ba5bsm70882847b3.0.2026.11.03.04.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:59:49 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Pablo Mazzini <pmazzini@gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: preserve A733 firmware voltage modes
Date: Tue,  3 Nov 2026 09:59:36 -0300
Message-ID: <20261103125936.156701-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031020640-263f7b05-a7s-pinctrl@gmail.com>
References: <20261031020640-263f7b05-a7s-pinctrl@gmail.com>
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

Hi Enzo,

I tested your patch on a Radxa Cubie A7Z (A733, 1 GiB LPDDR4), running
Linux 7.3-rc6 with our local A733 patch stack and SPL/TF-A/U-Boot,
without the vendor boot0. It's not your exact base, and a733.c applied
with a context adjustment (same change).

On 10/30/26 22:26, Enzo Adriano wrote:
> This preserves firmware voltage modes when explicit bank supplies are
> requested.

Three warm boots with your patch and one with our local A733 pinctrl
patches as control. In all four the main PIO and R-PIO voltage mode
registers were the same from U-Boot through Linux, also after the
unused regulator cleanup. SD card reads and USB1 Wi-Fi (with R-PIO
GPIOs) worked, and the R-I2C0 bus is there. The control produced the
same results, so this validates no regression on my setup rather than
demonstrating a before/after fix.

One detail: our DT had no vcc-pl-supply and vcc-pm-supply, so the dummy
regulator reports 0 V and the R-PIO path isn't exercised at all. I
added both (3.3 V) to the DT in memory for the test. PF already had its
supply.

I did not test cold boot, 1.8 V switching or A523.

Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com> # Cubie A7Z

Thanks,
Vinicius
