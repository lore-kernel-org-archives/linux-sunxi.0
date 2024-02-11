Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E170340BE1
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Feb 2024 07:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707635715; cv=none; b=Vp3OQKb/8g81kBreYtiTArVv9FVxTzW3bjZbxHHcP/8MmaaxzccRmcIkO7V9fN8kOAhE5ounQGRm+IVvIGGs2D1191mip3RrThQ6QnsnNXVAuK95KQL5OGcpEgGvpedDG01A8vuJuW/4R7+A26WlTkaDjpvycgSDca5YtaCNn1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707635715; c=relaxed/simple;
	bh=kql/nHMm6T19x2VYu/8rtjfvbmpEsr9DvyQkFOUrpf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AlDWQ8amP0rg4WbIIBf4Mx4JVWmRCt6iwwauVF6vr1KcmgSpZH28zp6jdYeXy0JGp2T5iB0PY6sYx90OavoYq/fd2sZmJvrhGvWV3Oi2XMBwwlXMZRamEEDvR8FQtkzqenxw41vgAE7CD2DsLL9vt8ZSzdd8ly8oNAO9Kx0/V7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OFYygLhr; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OFYygLhr"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a29c4bbb2f4so284331166b.1
        for <linux-sunxi@lists.linux.dev>; Sat, 10 Feb 2024 23:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707635712; x=1708240512; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kql/nHMm6T19x2VYu/8rtjfvbmpEsr9DvyQkFOUrpf8=;
        b=OFYygLhrbTTcGIvCOKdjYJIHDv/Ek6XSQVQ+o2Wimezi3O7I7gO4VwiuZRrDbVVAoP
         3uFCVO/9vzzP4wkvqjvP+SrCZYfYvUJQoGd+YP6zmjGtXs32MiO+AaAwicUa2TTjdAGu
         LCeu8eyVGJvleoyXjaP03vQtVw1f9pph/hn+hxPyJoRwOT5/nkS1W8zxmqHbougR1iOd
         5xlOY0n1P2o5XnQPV/5RLzCPNJkWVbxiUzSDRgQnsx9v5m6ThaX8rHNvXkMBopiMvLf5
         2iKdizVSMtS7KVCzdChSBhE+NL2uuWqQtG5HJYlZwdpommU8K46HlX3QDuU61eXsRGQ0
         7Bug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707635712; x=1708240512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kql/nHMm6T19x2VYu/8rtjfvbmpEsr9DvyQkFOUrpf8=;
        b=YcyN4Op5eYfDCWfs4r2MFwEYzLe8M7JMX1+gGRJFB6Dagg5wh2axC8kRbDlvw1rqhj
         sZcI8VY81EEipZmlgc6yu1XYP7YgNJjydyJtYKN8yLmLYYYR3gQZxFePPnnyb9eQfYwp
         RLAE2Ex0Ccvei4ayBKIQGOdlwBXlcxO6/UBkZKdUbWJUVZXkovmhHxOJVi8FVvCX3mrC
         O1a4CZNbKo8URgzu+8I/E5qU22Pz4eZqW6iK4WMFjGneNzw5Tw8DncaeLuFDenc9FaYV
         9yUPw+9hsyOk/JTjTPWioeTK7FrfZwLLKAPQ2ZIrD6mxPZNFRG9vL/AjOekis+/CfLwJ
         nsvA==
X-Forwarded-Encrypted: i=1; AJvYcCVN6hZ6vuB2osdrk10ZB0ZSKfr/3IE5FaU7ya9lonPTFvBA5705lbGoylYJw3ZdDsIrzREseaD8e4u+iUEzxhfhNr9w/JgqB0IDDX4=
X-Gm-Message-State: AOJu0Ywr+IPusWDv4dp/yJngJN/cIfkXZLyI3nygBHxxA5EhaLGMMg58
	XS0SXYL6ileMruM5Y0UQoZvkWyvcChxxAHs6NPzP+0oISpj5tTni
X-Google-Smtp-Source: AGHT+IH5Oj/EgxNbkTQ2kneuQsvTJX1fVBO6ran1S24Hyd95M13+8oo64xOe1qpn1iXS9mWLmVDIFg==
X-Received: by 2002:a17:906:f1d1:b0:a37:2ed2:cba1 with SMTP id gx17-20020a170906f1d100b00a372ed2cba1mr2518282ejb.22.1707635711866;
        Sat, 10 Feb 2024 23:15:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUNjk/FIZrbBqqnqJKR4K6hq9yUIHExAQz5KmIGl5tvMXfx+qodqQ5mKt7Qz5kl3aJm0zitehkTJ8Az0EIOvNhZ7JlMa6kcCRZgystz53mknmRN1JBXqM3emjMMp02FMbcPC3cqJbqLUErnQJDIXd+JGzpD4In+t439okilx0deAIWkhakzpETB8GR+SEwFugvIXosB4hg8hQ+CU/PuMUlTbUIj/PQFu1Sc/k/aG4NWpB194KpGsdQB47Rma8c4cWF/OZVzJw7oy6ZiVmgnycOWZI2uiH+UOHPCRcLCwhIUuZv7YEM=
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id qf37-20020a1709077f2500b00a381eea0e9csm2586258ejc.197.2024.02.10.23.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Feb 2024 23:15:11 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h616: minor whitespace cleanup
Date: Sun, 11 Feb 2024 08:15:10 +0100
Message-ID: <5754939.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20240208105301.129005-2-krzysztof.kozlowski@linaro.org>
References:
 <20240208105301.129005-1-krzysztof.kozlowski@linaro.org>
 <20240208105301.129005-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 08. februar 2024 ob 11:53:01 CET je Krzysztof Kozlowski n=
apisal(a):
> The DTS code coding style expects exactly one space before '{'
> character.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


