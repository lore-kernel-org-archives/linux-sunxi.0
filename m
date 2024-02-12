Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C234644F
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Feb 2024 20:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707770827; cv=none; b=OqLegoX0To4lWywV5bvp5e3XYMmETiZIEbGkODNtHxUlQdQEj9ZTqQVF+iWNKZy88zwQxcPLu0iCdK92mnIb/k164zRQ1O+WUQfjqIc3bu286kDQpARNBdhNn9rsppMtFTuAecsX/shHJg4hJkk1AuPiygmJ+t1tANDiS+ffrE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707770827; c=relaxed/simple;
	bh=fn/5FyBTMnahqzrbwfSbO2KeE7u5oVugq+iHM/NMsHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CEKpRUvnNFhnFN1OzYBt8k5UnuNU+ao6M0kBXhnfPhvj4+PJ2AcFByawUCMXGbID2RaAQkmVHMOfLdZU21mlo9vkz2MnwqEzTLad0RD9ZNH+xk1Pncs4Ehn9ChU2YwFZV4jWcL24zuPtmJzJGgG1Hc8Z85vOh36OYhBn5sR2Sb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U05XGiCk; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U05XGiCk"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-33b7e136a48so865731f8f.0
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Feb 2024 12:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707770824; x=1708375624; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Wilr3QrMZJFwg5LcPt9WBQXjwBqyBsWNwp0pkv/Cww=;
        b=U05XGiCkfoytnQfNL0We2l625JRO6K30gzFCk4EKJLzLqQlVTJD/Wg4/LygqWm31uA
         zNlrznb8P0MUz17GznklPsS2cOd4ApyXIp8aoAlDx93QucHytueQyluVE6gKTfqznbli
         pnYbA534yjUzVYamfVrwTjcHv/LD9EUlGYspe0mfe3fBM7YuhS6E7cciB2WguMrTr8lo
         Hq+i6LgoL8msoWlttugjIwzrp4pcqcstKLJV0etRyqYNpqaw5HJKaXFAqE7Hf3D8C+gJ
         WpKD/yRz6pnhkJi1qVko9VPSKHHyIhL/FowrSUcNycdx0g4861WcZiaTYA1CyaOElbuU
         JFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707770824; x=1708375624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Wilr3QrMZJFwg5LcPt9WBQXjwBqyBsWNwp0pkv/Cww=;
        b=XmlKfLkkbhj8W7eVmbCnbrfx3HdX1Mig9Xccrk0tKQnYsoQP0x+RPYM9/X7VhedUYz
         M0qfCzuvhQ1vfzvsXfeElD/etKLIurv5ehRwI+7PpKXzX7G5MI5jiskJy4e9au3hWcK1
         LRBjYADHePGBhxBWRLm4934EBbKnMt9ChQm3cpr53IAqM8TQfEfwsmEiIGgUo0aFe8pA
         7XdgekBS9FI34mU8lu6+3gPOvFlJqd4oL06LE2a3o8zHUUyBLQpHTBihJ9eZqsTI9Shf
         ec7ZhqK6uWeJHMESKZDbzN51SWz+8HkT42EuUbdvPav4l2ynagjJy1aKFlGyuS/fEBR0
         cwkA==
X-Gm-Message-State: AOJu0YybnUmra4EwSlz/wNhMQhWRtkofS6g+HyjAQVZee+NB/4YKwF8m
	po4SS1CQ7DU+c6Rjb2UC14csX+fPf2WMe7oGM6LeQlydN6wcmOE5N2lAzKLP
X-Google-Smtp-Source: AGHT+IHQl8C8lV6IrF9Twikea11MfjHKeNl0A2ayoFaUaUSjFQctY/JUdfxlgWGuijlnjz/l7OG8KQ==
X-Received: by 2002:adf:db4a:0:b0:33b:3bad:d3ee with SMTP id f10-20020adfdb4a000000b0033b3badd3eemr5329806wrj.43.1707770823491;
        Mon, 12 Feb 2024 12:47:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUGijjUNoZKPS9rcc3LIBg6g+m0cUf2oDK2qWYWYsKjR9Uwl61nvvPEjrpEe288Kyrl6ndLcRoJagr7jkv9oJCmOkmMihcxAHmQ0g0HUsGlLSyPJT0G3mYCwMgl18CUvVeSQFDpTs9CeKbvG5QCXjBUnZbRMlReYQE8SblNakkPflYhHUUre/JRVTORIo9RmEwZdmRyP1aZRUHkUE5Kdi3trY36GZHoBn4X9YTwLxifE2D2gMWIXQLFATFB2zrvQHU434BpaBl0qv3jYMtwUFexVrlHDYJCTJi1KhMldp5NA9QXjmUcLbXcpbPpqwrVytsme8OOxv+Hv2crtoxmS1ftdyrKDl8l/yuupckBJNlAiW4SyOIoLdI=
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id bt25-20020a056000081900b0033b792ed609sm5526948wrb.91.2024.02.12.12.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 12:47:02 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>, Jisheng Zhang <jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v3 2/2] arm64: dts: allwinner: h616: Add Sipeed Longan SoM 3H and
 Pi 3H board support
Date: Mon, 12 Feb 2024 21:47:01 +0100
Message-ID: <2596781.Lt9SDvczpP@jernej-laptop>
In-Reply-To: <20240211081739.395-3-jszhang@kernel.org>
References:
 <20240211081739.395-1-jszhang@kernel.org>
 <20240211081739.395-3-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 11. februar 2024 ob 09:17:39 CET je Jisheng Zhang napisal(a):
> The Sipeed Longan SoM 3H is a system on module based on the Allwinner
> H618 SoC. The SoM features:
> 
> - Four ARM Cortex-A53 cores, Mali-G31 MP2 GPU
> - 2/4 GiB LPDDR4 DRAM SoMs
> - AXP313a PMIC
> - eMMC
> 
> The Sipeed Longan PI 3H is a development board based on the above SoM.
> The board features:
> - Longan SoM 3H
> - Raspberry-Pi-1 compatible GPIO header
> - 2 USB 2.0 host port
> - 1 USB 2.0 type C port (power supply + OTG)
> - MicroSD slot
> - 1Gbps Ethernet port (via RTL8211 PHY)
> - HDMI port
> - WiFi/BT chip
> 
> Add the devicetree file describing the currently supported features,
> namely PMIC, LEDs, UART, SD card, eMMC, USB and Ethernet.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


