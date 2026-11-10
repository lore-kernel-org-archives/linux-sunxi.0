Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794276703;
	b=PrEXl5U2s7t+t7K59/x88MKgKQ6JRGcI1OEhR/TAHXpTjv1TcFClvszMejkxvEL8WsTV
	 JT4JHzIBg4nbi69gzr++gxBU0KmnCxBGDL14A5VIq7OTJcHcX5tvf6UshyNVSII/sGc52
	 CNUyi2gD9uLLh88OdhG57hV7dIxuQPcYfUb0iCztUE83KkunAhrG/DjodH26a9WEuiqtb
	 vkJBQvtIo+wP9Il1kogQjuRx/fEwuc6RUj00kNeHK+tZ4ndpG68SDfGQZ5Cj/Vro/O+4H
	 3zJqfMgUfzkzKxQXIWg8z8TdUsDCy7ctSrmzFEKxPuZx2VeTYralmvLcRVnXvXV0AGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276703;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=MXJ3yo+U7Doz0e8n3cFxrPAtyC+QNHJu/0qF308IqpM=;
	b=V0ZGxqBLbOaf0pBNw0VVgF+TkcRyvJIza/4fPHjDPL9ua33bJmnOIn76BXPpOP9ReGAH
	 9wMv1s8VH41W678L15cHxrK/fZ0vjDO5m3nOJmdzi9SOB+tZ4arCcLWsgyFiUzGqpI1/O
	 qyTE3I8jWXh5RRMdFmodXcwbSLoDhBcQA+aKOw0Mh4kLqh8NT4SYaBROfPOL0iMQLmSOJ
	 WUg64ostZY9pedONI9wigu48pkE/K5LwgevBCDicsuR9bDzezmrZ19KxfChGSm6xzn0Vn
	 hRPqvYP5CpEG0SqUFe7v298FpR0PamJQI8Niq83H1DP47GwI6wdfMofaaH0MXQ1/w0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IhBXtH3n;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F29606A33B
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 02:11:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7F29606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IhBXtH3n
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-716ea2598eeso883426eaf.0
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 18:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794276702; x=1794881502; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MXJ3yo+U7Doz0e8n3cFxrPAtyC+QNHJu/0qF308IqpM=;
        b=IhBXtH3nJOKdFX/CJC2ku0ZlNu3f/Js7lqShugdJGjphAEWpuu9VKddd6CEUcKX34y
         LHumiJtCpqhC+hZz1xilW1AJohk+zWEwoTzTHZGD9hE67sNpsgOKI8+UD6wP646Hv2UK
         T6ipHT1i14ZtQ8MveZiPaglCS5kMPprmLdBpadoPCqF1JtVuLO6NIgWDTm7qkRaBd+/G
         PitXC6xodWoMjIhY7YPsthQMJDobrthdg/T5pfeqn/9ye4Xbr4fZMXBC4MRiqPlSVOzh
         qqXun3Vz+N1JWeLXqq/7xCHe4pz++WwkLjBwjmOjHijRI1hszvaiNOGn4Irtv98pjtNh
         jtZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794276702; x=1794881502;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MXJ3yo+U7Doz0e8n3cFxrPAtyC+QNHJu/0qF308IqpM=;
        b=jLYLKfiCeGwDpB89S3T49ajHw7V/iGZQvPpQ8spATW5JmAo55Goq7TLOEQJWRbX0f0
         cC6gbjhO8Jj/8PxS//L1rEs7SkY4QPQ3Vn3QlRCyk7LgvKI2hGdhTERvqgm78E6O8GBh
         DRmCXFqu0QsJJIwkhcR4FQxBudjJecLFnipoGBV1DblCSwH8apjl3D+FJD9DpqaO5ys/
         8En3/pKgRIyfAx8B8FFhNvnC0XmIfs35etFrrtlsl4RZZM9AGdftUq6VKwH6nmfLBCIF
         wsIVPw98dU6heQC0CkIh+MbGropBZT+LXfylrqvkJW2OaJ9wcym/hjqI1+BCfClvBk12
         W/pg==
X-Forwarded-Encrypted: i=1; AL+hErEyRb4jujc9PNr+B4ZIxlNyhffJQ20ocn5UwLKTA6omYq+N5iK8S98xU9hIp46FZtGJ62aWiszfMrKPNA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+yUNdA8YgaDIH2DfR10gPpPFSx6bGcNEKU/KrYxg9nDuSag8pE
	7Yuwxt9P5PvBoep/zusdJ8bBPmBuUWpnsGFrPoZCJMOmv3RcGkV0Oh6X
X-Gm-Gg: AYBFou1i95z5+Q5UMfcstO9ba/1Vy/QQAbZvF3cZ2lABsbkvl1zxzTVbd5lu+DduDOc
	XEmiv2bB0x0ksUFdqMK0t3hgPAnJ9ePFx31nPdMF+iR7FZrSI4sG1Kdmn8kM3I5NQO+jsVQUI/Z
	6JhYQ/6dchIAHUJwB5kfx0rzAYGiJA1Vgo3FVi35iA3fXVXL7PUn+K70kriIu7zf7xR4StSjrF+
	qIh8OugUGTeOhJTnXF5rufmnOvvZYLEz6/GOhVLyqviih1FTDa0fKfwdLajETp0bqoHajyQBCpX
	fbxt4Tr5PbtO88a299MUOnaDcxhcrCD8Pl3dWisxlfS/WkGM6FVVT4snRnlBzOguQ+pKWQS8c0H
	R4b0+ZG0yiCAC9+W9Xgh/ZgWwMIfV1kKFp0IjTZS3Ly9aAmAB5jx8NX3kNhgCl08vF8ss9w8xZ7
	AeTIsSwbQtsKwTsJWONRJ92pkJW6nCeDBA6OwZvajRbANjBKmRfns909idfnyZXye34rULCpVRp
	w9CQADKZswJag2jknUepszA3RkLOLD3HF+xhxCFcB/BCGFwd/xyPHMAr019rGLf3Qy/PBRJpDXP
	1+dONkN1Qwf5sTpl1cgFPk9bN/PgNJrMIp1jXflt3QXL+v0+c5wNJGad2PGOsMcMP74ig4K2ll/
	4hIYarA==
X-Received: by 2002:a05:6820:f00d:b0:6f5:a49:616b with SMTP id 006d021491bc7-7189e73a44fmr602567eaf.0.1794276701742;
        Mon, 09 Nov 2026 18:11:41 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718aa034ad2sm663402eaf.13.2026.11.09.18.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:11:41 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com
Cc: linusw@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: sunxi: preserve A733 firmware voltage modes
Date: Mon,  9 Nov 2026 21:11:39 -0500
Message-ID: <20261109-a733-pinctrl-v2-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107000135.6b684277@ryzen.lan>
References: <20261104-a733-pinctrl-v2@gmail.com> <20261107000135.6b684277@ryzen.lan>
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

Hi Andre,

> I guess this has been written by an agent who like to talk?

Yes. I use an AI coding agent to help draft, build and test these patches;
I review the result and send it myself. The v2 description was its draft
and I should have cut it down; v3 is much shorter.

> So as I suggested before: please introduce a symbol like
> BIAS_VOLTAGE_PIO_POW_AUTO or so,

v3 follows your suggestion with BIAS_VOLTAGE_PIO_POW_AUTO, setting all
two-bit fields to 01 once at init in the generic sunxi code for both
A733 controllers:
https://lore.kernel.org/r/20261109-a733-pinctrl-v3@gmail.com

Thanks,
Enzo
