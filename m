Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304482;
	b=gnv3hT5Hv4k8gjNBdiQUih6MHkA7j/PmuYY3zjK4rJ/qu+1SQvmzWgOLc3ixzfdCY+tP
	 +KklcHEIbgop7q8dP/EaFHndvKoCHMEZFGJm4O9jKs5PaoQTTyQjXu+yGJWchQnXnE0Om
	 t3hUo+b1fNyGFOF+yE01nz+/30wlr+Z9XamJshLEGdwJfUMcXii4qz4acH0+bdQSMLFHX
	 n2enQYY7tENS5xDiWUeonfIA45ZxKycQMJPZnwbjP96sQNafBBoQeyzaGg/ftp/CdvY9d
	 dNZMgPek6aTGF8EGQRV15tu9lbqR9+qQ3DSwx7PZOjvnQkgu98HiZs5V9m+QXf8Q/cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=XoornKh9z5jpJH7j8+EuQEpUcX1Rogb6YE7C2nngtQ0=;
	b=EOOA4GH7BXDeMH1lmCzuy7T6J75seTGIRiUY41Kg1n6UrJqFCP3xhxv3UaaVCCqFmrQY
	 f+RY3aW0HYYAzLcLp/x9akq7g+TwpRV2mwcTqtOwdn+uIGz75Cxt3YiARipKWTiIES21j
	 u5QsH6O89B1RKIuUQe5SKBdRJTfq04cdilQ/jm5AGHWfR3CH4BJ7pdoGA2Gme7hSHO+5+
	 hYUhZK11XL/NUnoLC+XaE2DY15fASWpc1DNncnZ3FJXsKYiI47cjRjn97rZYTLKIwP/6l
	 HxskF5In/mdBHXBGPmrX/qxNgTQxBuIifz0Yj/jrU9Kb1l5bdAmlDkG9HMK1cp9vDIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N0UuQGxA;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B6C606A31C
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 09:54:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79B6C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N0UuQGxA
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso19245505e9.1
        for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 01:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794304481; x=1794909281; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XoornKh9z5jpJH7j8+EuQEpUcX1Rogb6YE7C2nngtQ0=;
        b=N0UuQGxAclwo3ffP+9KGiJedI+dxk+616y8/wWmVBQsc5Yy34s5cKDPh8luCpi1WE0
         xm/rZ0NfFt4Se3NsmEz5esY0ZdNb+BTWmzSWqgSavCwes5h7Itn7d5AFNrUYBMkMllDi
         /p0kKIcsl2ki+DGH3qimnBjmbdRv6CIIO0Ew6aUp4uihR7/EnqQO2wY/GD8zmAMOLlxN
         otcNk5I39uIsdiUz6/lMJ4CbtrSGlKJcXXqzP8Wxk/tfjIj7ubMCql2Oal0FHNwqazyC
         4PRpilwI4IyQ8z5ahWd0MsfAFADH7R46fk7HejTX/AJ1htWcnnbnINKaDvhUpvrUxg/8
         7AoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304481; x=1794909281;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XoornKh9z5jpJH7j8+EuQEpUcX1Rogb6YE7C2nngtQ0=;
        b=CIqXFi4FYOjuSstEtKNWkgBev3P/OLTTO7uH5NzDF0yBLpG8xkRZAS/MFdVVSrnLAH
         P4GthejzhDTMYCHhoTduD7SQq1c9KWv4hq966VLLamcHsX6R7IFN6zXkOdgXlUQSe6Kn
         C/k9PKoGUn+r6b7g5DG63r5rCkMU6ZxXkkEW6sRSqgfHXYPQSDtgVUcVLLmLZ8E7yihL
         DTYJmTATYmWDlWtHW/HPQXoWmwWw+Fu8nSQ9h0Immnidx8AJg7hG9VaCPE8XenU+1pGu
         fc2jP7QbSjV+yoUejphj+8I06S1SeEsd4Du/QBsR5NXzIF/wUUCU+u2TMawV1QA0cLde
         bOUg==
X-Forwarded-Encrypted: i=1; AL+hErGhfnlyg3nKBG2MHIUqQAk46Vs4VFz/0UlROlRQ8xx0vaMe9CAzIONB0T/z7vz9ptktxKnGLurkYCpyyQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z96hPPgFHGUpGrfNlOkjhSbcXdUME9yfHbNito/8vneybeUEDZb
	+1v/zgGYLtjBj0Eg/wJKDLxNhg1Zqf/kToE+yGXeP+I91G55Y4zV4INe
X-Gm-Gg: AYBFou00Xh43PjC/GgeaKhfxP5eLswXJBRnTmz0tOqS5MH7GohKKe5pbDQ0ccfFe/dy
	jpPZLaby4J5y6HsvXcXGrpffBbZa/WtlD+fHgtQc1h9j+RMTbhrIDWvNeCTejqMl+GNtYHX6e6u
	JdiZchrlSJEhZFNivIq/DW+017ULEWPyEmFy+dq1fpmLiANAzSj6fKW7w2arQJC9kablEW2ZuGl
	IIhPRjR0GHSYQKD9uXXFOsYdh21vz0nr7RDCtRom4CEdGD8YBW8aypJmwbbJvw672J9F9ceMsm6
	oelyQWcd8RoCO2ZAdZU48tVv4cqYRRg9GCURdmE4xTnGO5PlO4nGTo6dBqL0NVH5+C2AQk8fcJv
	C9PP/dRdzuLJP3JiBKQfoyRqsA6gZ2SSyBmJLzK+nzgy4xlQThyfHeqyE6GkxEJndbGxYmAZSh9
	aD5uyOqXlzF1cGhb4kO1kkpskagWgZUQs1tWs7MaO/Z8LdJuGl3SorC+1D44oyxoXuqyhppU41r
	9iELK8AYqkNf2zskCnotFjPNO7WmHiT/Jhj4kay5UU9s58sMX9pKUQfcomjfstcIoPa8sVLfZCY
	TbupHCZB4s6BSJJw4ronkpERtFA4OrF07W7XFx7E4KtFgd9edeg8qawCgjYpAZ2S13fvG/9ZoMh
	IP4Z6Ug==
X-Received: by 2002:a05:600c:4f4b:b0:4b1:32c8:27db with SMTP id 5b1f17b1804b1-4ba0234bd12mr43740995e9.22.1794304480565;
        Tue, 10 Nov 2026 01:54:40 -0800 (PST)
Received: from ?IPV6:2a02:e98:40:8091:e8d5:38f4:f7b3:6dbc? ([2a02:e98:40:8091:e8d5:38f4:f7b3:6dbc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204e22csm48483805e9.12.2026.11.10.01.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 01:54:40 -0800 (PST)
Message-ID: <873c22a2-fd3f-4927-a06f-16a73c30de86@gmail.com>
Date: Tue, 10 Nov 2026 10:54:40 +0100
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/11] serial: 8250_dw: share RX trigger setup and
 describe Allwinner UARTs
To: James Hilliard <james.hilliard1@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
Content-Language: cs, en-US
From: =?UTF-8?B?S3J5xaF0b2YgxIxlcm7DvQ==?= <cleverline1mc@gmail.com>
In-Reply-To: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

> Based on tty-next at 6628e7d4c6b2 with the posted RX trigger callback-lifetime
> fix [0] and DW BUSY-safe divisor fix v4 [1]. Platform setup runs before
> installing the BUSY-safe divisor setter.
> 
> [0] https://lore.kernel.org/r/20261024-submit-serial-8250-rxtrig-lifetime-v1-v1-1-731b78d5003d@gmail.com
> [1] https://lore.kernel.org/r/20261027-submit-serial-8250-dw-divisor-v1-v4-1-41714a75e15a@gmail.com
Hello,
thanks for the work, I wanted to upstream my changes [0], but got 
redirected here instead. This fixes the issues I have had in a better way.
I have tested the whole series, so I reply to the cover letter, didn't 
make sense to me to reply to all messages with tested by, but I am not 
sure if that is the right way.

Tested on Unipi G110 controllers (Rockchip RK3328, CPR-described
64-byte FIFOs, ttyS1 and ttyS2) on top of tty-next 6628e7d4c6b2 with
the two prerequisites. rx_trig_bytes now reports 32 instead of 8 by
default, and 1/16/32/62 select the matching hardware levels, checked by
chunk sizes in internal loopback and over a real RS-485 bus between the
two ports at 9600 and 115200 baud. Changing the level mid-transfer
kept all data, and the level survives termios changes and is kept when
set while the port is closed.

Tested-by: Kryštof Černý <cleverline1mc@gmail.com> # RK3328

[0] 
https://lore.kernel.org/all/20261109-8250-select-u6-64bit-v1-0-04bc8332fa34@gmail.com/
