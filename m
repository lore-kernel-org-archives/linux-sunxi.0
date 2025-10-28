Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770CB3451C9
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Oct 2025 15:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761666371; cv=none; b=Y+NpJdpd6n1+h42eLpmi8SPjJvuCk7u1jUrhAqxbvcLhs1BzfNs1p7bQLifHGrIqsnnLhwobJVR7PJRXUdtq+QzYSSPruuGblw6bDMeEc0iPiLhJyHbW3hTJF3s1f4sllawTVKpmJeWahP8ZKsma3xcXE6Z9OmZ9fW7QT9R40Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761666371; c=relaxed/simple;
	bh=C67F/J05mAe+rfgJ6AOhDZKKwYuaYMQaqkEjs240jaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u9cwWwXzm7wBKgRYq0v7bGFSNYmosmQ9PGkkUGy2F/MrrME6iwluNmVX4zLrB6F3SYmBIkE1oCbek/LQWx/rrKuY4P7VvA7ysOWPOjaTMTW7JJ6or0BPwi9v+rsSzf1jAAwL5hkL8AnJHONkDvvG1bKWt5OrwrgKcUYkN79sYkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mqEnkrxz; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mqEnkrxz"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso6191628f8f.2
        for <linux-sunxi@lists.linux.dev>; Tue, 28 Oct 2025 08:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761666368; x=1762271168; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C67F/J05mAe+rfgJ6AOhDZKKwYuaYMQaqkEjs240jaM=;
        b=mqEnkrxzBFTcMLAbNkMKeJaeTPlApbXpwJmsB96wcZ1SYU9+a10exZT7ApJhWZPksM
         89VYBA1cF2WwL39+5u3arPO8rJK6vOlHXhgGwvJARo2xHazYMt5kahIRD7OrVZlOyCpo
         IHpaAsuU2xDtPhT4CvX5b8lTYTo77FW/ZPwodJlYzc1Sy8Y86vVHYFcV4+JROvI/kjdB
         XwOWKEzzG3syknpyz+9MO2C2YQGPPGSx7pRmowoHQTO6D4LqRMrE9016XfBOlRZ5heZa
         idKbcSeJitLXPWB/gLgac3UaE1mUHzCmZ5ZJ66oQ1pzYmwp0/3oJ6f1xMTvdea6Uv23v
         dzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761666368; x=1762271168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C67F/J05mAe+rfgJ6AOhDZKKwYuaYMQaqkEjs240jaM=;
        b=mXMEo9rIOy6BDFyCz0cGa6d+Vdqr+WUWhp/ZtcSYuMWoyuIsHlOuU6B6dAFsApdfZc
         N7J3KOy90BF3Mo02id3FaGNqB8wmjYQySU55B9pJ1DkC5FFbgZZ8P9UaFrlPBbTgKK7s
         pkUNUwSJlurFQI+uGh38bItgcB/jcDFtY7xXXRRi9lRdJewg0dHO1PooTv4XO3r532PB
         G8u/OutIprM8OOgjIxXcbycZtXsCEUDcVQJSvhizgNzpAwkJbe/KVm1HHcrTXpfoZBh4
         ZC5oowupekspaUzRBQeDuFIquUM8iWIDoYBTOBqVl7Pa36MbPH8GmkpmTbhYacpysMND
         YaUw==
X-Forwarded-Encrypted: i=1; AJvYcCV7GYCf0demoIe/JuyoqsU9cXJCbwp7iJ4UHXIdPQWPwThQyOWowbkRrlXza0fMrKoTbwNjVmdCeiRiEg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwjqPbE3SXdKRlDEpry5atWzQWAud0mV+417eEKVmHFVz7ItQYq
	7dm1UZB2ZvLzO4lpPxSyI3nQYbEAvoVOQ7o/ukv55xWlIxcoom5bF8s4
X-Gm-Gg: ASbGnctP3baKUiQi+WD7HhdS7dE+PJES05ydUrdeZ36+LfA/BLMM+57Z0jNlwIAxolN
	TxHcaFmdpx+MtzUOR+Qh5BSgQ6Xy+LNsFvA2uQb2QH74F/HvDtNnLaFBE5nvXXKbPit0zbzlpOg
	XDbtNJEx7mrEsWLOjtoxCWV8OvXZHmDAe8FaWuDStBYN+6e5LcMZiMHSmrRR4louciSUzD6MVGC
	P/GYD/gFg4X3yocUg9rFEAXCSgovimupoZOg9bB5iVxWzkgtUJIgyww1IFMEepYbCbFiPdgpA6C
	nO/SBbOHeCKCL78+SawchoIk1lgZ6UdC8big5zthHzqKBfDXomLlEgg5Wf5Z8M9iBhScrp+oU8i
	94mU/cKh+O7MsZnqW/l03eZFlOvoMw+GrlwqFO4rbixYbX/MwaZm3JtCsNiz3KboW808JXQb8Oh
	n13IZksfNy+15BMvykPZjA0rq36vNsb0teSy2g56ijrr4BQikS+8tY1/1OS8gB5+kqhSvw
X-Google-Smtp-Source: AGHT+IHosnjBq+7lnXCkpH/VCvR/dfjIj3WsAxDBH3sVvdzDiErsKruO/jAMqh6ugeSBky6z5EKP1g==
X-Received: by 2002:a05:6000:144e:b0:429:7693:884f with SMTP id ffacd0b85a97d-429a7e35c26mr4283497f8f.5.1761666367549;
        Tue, 28 Oct 2025 08:46:07 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952cbb20sm20964431f8f.18.2025.10.28.08.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:46:07 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Wentao Liang <vulab@iscas.ac.cn>, Johan Hovold <johan@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@bootlin.com>
Subject:
 Re: [PATCH v4 14/16] mtd: rawnand: sunxi: introduce sram_size in
 sunxi_nfc_caps
Date: Tue, 28 Oct 2025 16:46:05 +0100
Message-ID: <4461451.ejJDZkT8p0@jernej-laptop>
In-Reply-To: <20251028073534.526992-15-richard.genoud@bootlin.com>
References:
 <20251028073534.526992-1-richard.genoud@bootlin.com>
 <20251028073534.526992-15-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 28. oktober 2025 ob 08:35:07 Srednjeevropski standardni =C4=8Das=
 je Richard Genoud napisal(a):
> The H6/H616 the SRAM is bigger than the A10/A23 one, so move its size
> into sunxi_nfc_caps.
>=20
> No functional change
>=20
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


