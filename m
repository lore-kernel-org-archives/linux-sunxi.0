Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576874;
	b=bqNNI9Qk5sY12Ved3YEmr9NvTMhlJkuigrKeZaXFmhi52dm7sX7FVqLBTcntKLQnd/57
	 6IduFuv5RhqYp/1vuNDXti7C6AFodNyLvaxGzt7SDBuz0JN4xt6XGwrf8/qVYHN41LE8R
	 HXg5YVrlascZoD3x1blaAwJd1gi5KyH8HHuaDQLPGy/2wPnRnKXpTY4GZ1z7DUJD3JkrB
	 YjqrniWyxUn8jOzcqwD+yjOsLrvN6tOQFOResET6mveN76TNTEToqhx02XkSy0V11GdXE
	 CkyxSaqIpBKh6VkiX9k8n97UjX7QNhb5yD3eP/SvY5ubJThW2Hu8uyf0GLS8fM5EddA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RVJTwN159znt8hJRBq+zKCr4Hg7h2qirYM0EqJu+lc4=;
	b=HeFTPn7dm7Pwl0/y67Sm8AsPVvCj/hg6yZeC0oLJNCVyzCC0q6ZGYDpNXNFdjRwkT936
	 wVtOnwjR82m3AKq8n1Y2bAa+xJpfePSVI3OMA80yIh9loBXUYdkBRitIovqarlj9dQ7qD
	 /o20Rnm71Z6RmdsgplwFSKxCLY25E+nDB/1pqqFlJU6JPDax8YZefLDBRbrLCaRhgn7ix
	 Tx2CVo1kPnp9qXgJwJRqzxmtKADEH9HbRHMKMBhWKHNtULXghZLUyEeyuWse6bPgNcsOY
	 8R/osN8WgLFrI3eimY1X7QftPthRTJNBhxQOPJNPH4vPedOubFmIk7PO9ax9w/1EXTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="TnBS/X/y";
	arc=none smtp.remote-ip=209.85.222.50
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4321606A31B
	for <linux-sunxi@lists.linux.dev>; Wed, 21 Oct 2026 10:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4321606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TnBS/X/y
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-99061e2171cso163521241.2
        for <linux-sunxi@lists.linux.dev>; Wed, 21 Oct 2026 03:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792576872; x=1793181672; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RVJTwN159znt8hJRBq+zKCr4Hg7h2qirYM0EqJu+lc4=;
        b=TnBS/X/yAVpp2PIE5nZTNqrwRMVvepMtw5afKYfKgvxxs3jb2WizSWCZIBGmnOFxba
         eywZYh60nTp+1P8TnUwCehuUv1JtGQD1svUy8ga+GxYJIC1jJwupthqdrQ0/Ax6S3Aqr
         Uvu1TRyCrlAzDBmrkB6bukxGBaPiqsZotdDXkFw7102g2t2ff0wtAipDbNHXmxuCYdQA
         rQ0HYSufr65BMw7dNTOfccewxXIU4DkF5eDMzUcCQoeA9owrQO9eS7tG5RE6hH87bWkt
         +jAkcmwofDehHYXYp7td6OglC+IwYwm2lv1XryOcoWP+ZTvain27HUWPgi4U+idEIzDQ
         YLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576872; x=1793181672;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RVJTwN159znt8hJRBq+zKCr4Hg7h2qirYM0EqJu+lc4=;
        b=P5PSxFkC/hspLeP9YfPy8z95eFEDcV3zVMgN6wVRCaqIRBUhVTO7Q7ZCkVMLKLo7L7
         NWostey1g+AhFxAN+JXIplB2zN/BTonNuEX0bDhOU33aqZyVtpndZtWMgvd7NdxjkVzx
         Ae2C4aEX3FSi22gVFsvsaJKjEakSK/X0CCMdWj4V0xTU0kq63E5fydt62U6fiYzUGMPb
         HxQhlLXCUhYMATsHrShEwTgdQVl7Z4j43duyeYru3Nn2RQjWDpuG4va1N+7HY6E6ueZZ
         FiQM/axrDbXwxGdxgTJA4SBlMXim4jB7m/15j5Llkk29VXvLJxq18NPxk6BZ29oEllVB
         J5WA==
X-Forwarded-Encrypted: i=1; AKwUvBwb5hN9vAjIgX4x6WQNuqTLbB04e+sjKk6zaQJxMYGRXaKCvmXjfu8Lf70dXjHxAxpPO5qlbZtHfoppXg==@lists.linux.dev
X-Gm-Message-State: AFq9FYKDXCxkdFoJ1+bhlEhHyPurx2BgJKzaAFTrHT0ljQio9KOZLfJe
	5RlfSl+UdZ/wp4gvZ9NnaFDDdY7B2mxvmXE+4nUaAULNGtqtzS72qkev
X-Gm-Gg: AYBFou0wmdMaWxKdD0xd5xLcDTL5WYVfowklJB1AatT3VtKp5cNkfbp7RpTWiCsAwjH
	WZyI83O6uoKDALfGF9X2BJWyZnXVVLCA4hj1EBD0cGD+sH6jOb/lbspzC49PAsDDb5RIeoF1VcJ
	z5gQ8kxiUi2ezPYDrxrpa6jqZ4U5JN26VP5qHyO344SBYOccHv54duq8/iJXbi17R3nQWtKL9ls
	mPCQ9Tr/88UxyzVngYECMwsmmXtkRQuZ1y/My8JjxDi6iLxavwB8pweHchL/HlZXE0xww5JTNI8
	TK+wvL6oWgI3Hmfp0PmpLvDNbMremFd/TjW9dX+bBCst3TXPg3OORaKCSRnU/c3jbvnqjzqDoCH
	wlrBMD0gCGrZWkwfIzxe6TVb2OIfNyn6lN1884/LQPUQ5j6Y804hpsQR6IKk6AQnES7sceD6Z89
	Xrt7Aj+hvZt+HdYOk3+i53dzWYGsB8a3m3uRAfbcSncCz28KJO0UtwqztLYFXKWzKaO28Q3kmkq
	mfxkSw8wyE324YeMvXlXe1Rofe4RyXJXDbXJ5jPUMjCv20O0Q2Z/n1WFXkNYnBno6t9Z2WfoG8K
	RpUQZFQ4XPHhLtHiDK9tXv97wxp38TW2M5i0V0wHXNbaX/wrkIqJ0NLlCw9I6SM=
X-Received: by 2002:a05:6102:4187:b0:7cc:776:6c41 with SMTP id ada2fe7eead31-7cc9273dca8mr461720137.22.1792576872539;
        Wed, 21 Oct 2026 03:01:12 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990d118d522sm2526812241.10.2026.10.21.03.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:01:11 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-serial@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] serial: 8250_dw: Keep the BUSY-safe divisor hook when DLF is present
Date: Wed, 21 Oct 2026 07:00:49 -0300
Message-ID: <20261021100049.16504-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <athe0QikG2mzCAtd@ashevche-desk.local>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <cc358c2be6b0b4ea0323e4f694a581ffb667112d.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <20261020104753.28703-1-vinicius.eduardo.pedrosa@gmail.com> <athe0QikG2mzCAtd@ashevche-desk.local>
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

Hi Andy,

On Wed, 21 Oct 2026, Andy Shevchenko wrote:

> Right, but have you read my second question in the above paragraph?

Sorry, I missed the second part of your question.

If I understand you correctly, since 8250_dw.c already has the BUSY-safe
set_divisor, you're suggesting that it should have the matching
get_divisor as well, instead of pairing it with the dwlib getter.

The dwlib getter would stay for the other users of dw8250_setup_port(),
like 8250_lpss. Is that the structure you had in mind?

Thanks,
Vinicius
