Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455765;
	b=uamKvT+lFacDd+VOjAgL1uZyjJXbPUrOOABzTN2Zy0FfmGMx9m9wi1cd5knyav3LZ0GQ
	 TbDgdGX6BTW9S2Ik8z/cuwX3Xf0HjtiY12MfwLgDwID3TIf+31MBWoiveEOX4z0AMXsSN
	 Ej+9zXQnMsSCCkFdjsqCPDDuikU/Oo5yNk9im2+IjKKqXYDQE1jvWDcmznKpfXTErc+7R
	 dtC3s9mjJMhUqbIgI7OJ4LeBvkk1DycZ0Vn91MeoKIkfq/oV/dHG4uEohgWL4485hp4P9
	 aU1jYxHyT6U0k6RFLXNu9IDwOJV2saAouMIQ6T61iLBhBn/XMnmbCYkp4PW688pX+LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=/dhg4VNb7Bf6y22l9FV1//VBS5m2KJB8FreMv5POxa0=;
	b=LbSeG8fAeWfM0rp15LkIr29CJrws47TqNOIVfi0lZAXb6taUUkywjn95hI+CjqBlu2dI
	 pTH5ZS+JhrGW2HQqILSXn6BryQBkyRN0uq9+F7nhvyhSFyCouJtCaAi4/zIcU2WycpsfG
	 NOPyPtw/SDPsXM38BR6EhEPHwtqe/CSuKnS/fPxY7otsXDbyYP82cNHKdeU3rAeKO/FmS
	 MYyqpbv7VO5tSIDOBcNj/idzDWmYN6F6/MheynIJFApFCty7NE3w13T1FO2WJV9bJ0svL
	 k4vYxm8E7d7NrAAPpfBIYbEESrV/k/YrHfMaMP1mcl+NW8kqkfQVSIbvVnn7aDB2Yeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OpblUkD8;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D615A606A31E
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Nov 2026 17:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D615A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OpblUkD8
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-71b0d330acfso2734336eaf.1
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Nov 2026 09:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455764; x=1796060564; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/dhg4VNb7Bf6y22l9FV1//VBS5m2KJB8FreMv5POxa0=;
        b=OpblUkD8HYBA4JStJdY5akjoXbozmoAcfO2ypQKLkO5N6x8TAS2H2dgqF7zDCeoVKA
         gs444OADkEy/pHqT0XXJTmxsB6cdNbtLJFRdsFaqmqbKK6KpK49msEjUC2GPjg1DkJkw
         uBd+/bOCv4fny26NvskBwnWNW4647cdvr7sLdhigLU5L0bKWneLS/rMtWEAKgh2XCEHt
         WeTZ+mbsxwFLaZzBOgTohL1/F+MeWa9U8VUBXd6uktSgbXU0RhAGS3DEBMq7OOlOJ7JZ
         MiqoR+6qCBblk/0pjfnhKokGqIC8gO5ndyy7eRRoQ7LUlAmS69mZZTALZL+fv/GOEdFm
         j+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455764; x=1796060564;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/dhg4VNb7Bf6y22l9FV1//VBS5m2KJB8FreMv5POxa0=;
        b=EU4LbZGfBm/RtRC/DSgmhBtJJYWE4W9ComOXScLfycRPtjdXfu1X3g0ZsTEZzGzSjq
         PCLZ/VDuRJdXObOH6fTKmY6+Zsk0h3jTud3cVQOf84O7T6sEFcA63J0AU8NocWSBcXVh
         H58qX8gWotjE7ShBlglyet+mDW53s9wiO0AoUNW2lj7kDGNN3cY3tz6QmMISwYGG+D8V
         1vojh83WikJ1yUp/sYqNd6spvkKIMwR8C9fvmhBo1DsK3p3fYOeLZWHIAVpQgHa8QKkF
         /dxg5IwqyZKVm+oDTh85SLRzLokaaJZTZVOGtv/JXjKOUGYzZrVw2JGMMvexAEwm59PO
         Xm+g==
X-Forwarded-Encrypted: i=1; AL+hErFuKtwCa0tGBe1LJF8ZEw7q/3Dl/tjE6QV6izWaur/hA2kvF734UhVJzDii+nfAQXMuHA7w2AI9zROxuQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8Sdc1J/iojMMStUmt352IIskKGs7aXQ/MgWRNzmnvHylZjfNEt
	cnlT/Os/0uGfQ/7c4Y09egStmNGHcjwbRplkF+iJVz8W7dNAVtq/3aaU
X-Gm-Gg: AZFdTZeCZHzoR1bwSNkFsgYF6sfQeTj0rS7vcqPYs5Y2Rsy5J3U0PZWqZm3ashkOM7z
	7Yqq4ioCS3FZWDCuSeUnNjwwSijS6bRCOKZGy1hbUVhWe9JOg8cFgoif0S3ozsRWtESsDgnatgl
	kVZc/BOH7sr/eBSV6EobfREVD1FzwcyLpWYgUTChPZTVWqyMT+rPaDRcFJSBTFAF68MyvojmkW8
	50E5BAdRPS4DbMu0/+iD3suqk6bt3GNPm2Xmo+nHskzK/U5mC0Qd/o8maci0WmdRx6ZMZBs0/bv
	EGzFVXnD+khXsB+P3frs7Rd0oOp0YO1wA5QKNV925BwzBvgtC84F6I1IUlWizfeh/oVNYggA3bh
	ZufzMro0gdx7KEoQGQOAqt7LpL3KpwdEc7sUmBlHkSTXVErCVBLGsQSGusLPsMpLpJlnkSpS8no
	D/LJgwwaSYv8cMdlBzkNxeJJNvcTZZXEZvFPoDXLlsDO8X892hRtbqkzfPEwZ4222zvmg7dqLL2
	MJzohP2zCPgEEWP2/wq91zhyfMp7WBkdx/ohruSj+2rUTK06tl5B0sUHWUs2mLsKlljEsWcNo+y
	9kpW9CFRrLJj1Lzm9FY7kPklvAop2iDWGdf+XQicjA27M08HYnUdIg20sjJGFEwjMTMN2YWtOA2
	UCa34
X-Received: by 2002:a05:6820:2204:b0:71a:e0db:7131 with SMTP id 006d021491bc7-71b327d5b77mr9724862eaf.63.1795455763890;
        Mon, 23 Nov 2026 09:42:43 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631692d9f7sm9343058a34.24.2026.11.23.09.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:42:43 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7S
Date: Mon, 23 Nov 2026 12:42:42 -0500
Message-ID: <20261121-a733-dt-v4-1-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122004008.0ee8e16d@ryzen.lan>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com> <428efa99fdd0182e8bc9a2ed88b78d2cbd36fa45.1795034153.git.enzo.adriano.code@gmail.com> <20261122004008.0ee8e16d@ryzen.lan>
Content-Type: text/plain; charset="us-ascii"
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Can you please add the A7A and name as well? I will send the .dts
> patch shortly, but having the name ready would reduce the churn and
> avoid conflicts.

I added "radxa,cubie-a7a", "allwinner,sun60i-a733". Both strings
are in Radxa's Linux 5.15 Cubie A7A board DTS. Please let me know if
your DTS uses a different compatible.

https://github.com/radxa/allwinner-device/blob/6d911d1582dcccdb5a4c38be8d3c1ee851019795/configs/cubie_a7a/linux-5.15/board.dts#L5-L9

Enzo
