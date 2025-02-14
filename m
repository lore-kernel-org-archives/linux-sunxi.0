Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DB025B66C
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Feb 2025 11:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739532190; cv=none; b=Gz6dlz9zxKnKr3b9yqR88dxgaQpC3YMVRIPkgI1pbmlIRxtWhYFK7VWcRsCgGfhbuEW5L/oVsY+O8OA7GHA7KERtjSMzPWS9Fmwj9xpEbCadK//p0XDzCVuyVOjnZWwWWE8u/CzA7zs2T+4uNS9SxBhtoGk78jYfYRVIueJ54+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739532190; c=relaxed/simple;
	bh=ncfBDs1BfbjE8HEdMRv396XMxgyF7oxwkpOZ9BEV/sg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IW/1lBm0j729e81RJu7pKhhAxLtuY1CBYL2KlcQtMTmoYMOFQ0/wul/an2gGez1TyDZAIKjFxgcc0mSmkZ4Ztk8Sek6YebyZqoUp492FwWwPhZffYsqKivykwbflAXpm6AuOIWgCzWCAsDljLL4nHvwpbwAyLegAssPcszq0bi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aBqA757c; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aBqA757c"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5ded6c31344so1877170a12.1
        for <linux-sunxi@lists.linux.dev>; Fri, 14 Feb 2025 03:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739532187; x=1740136987; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncfBDs1BfbjE8HEdMRv396XMxgyF7oxwkpOZ9BEV/sg=;
        b=aBqA757creZKljp5E0gjQJ7q5+NMLRlZ/FxKYN8jWfcu0MhPYn9nBQNIGdvkrzgmfo
         UihNGlWgypukgf8bd8YCIpPBM9mqRdICS6UQ9BMHqtm6qkwbcpFuAdZDFs7bYbfu0Gz9
         /5eJGnKWyI5Ki+b3vKcbONMBY8FF7aTWHKzu2Uaj5URi8iDRyT8Dggm5XXFckwFjkw3M
         vBbzhIaaVokC0GBkOujgX5weyRdl23nvITUTSbysCRwT+B/6h09jcOPlrVviaU5mCrtV
         oXKo03xKh88sIotlb7h77Xzj7E7jTcaAsooFDGQaW3s8PMY9730aQ9rTQ0ztKOv4QvEp
         ghJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739532187; x=1740136987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ncfBDs1BfbjE8HEdMRv396XMxgyF7oxwkpOZ9BEV/sg=;
        b=rGThZ7mqI0VdjylbEeP34HQOMB9zFrZain9vitTxGxMXmFQK9fzfnfLKwKqsb/rExH
         Khv7pXVj7YPgaxpxkW4xO6okZremrajydejAIGO5dxIz6UNhU2bv3jezPgnRPItJjXNc
         m9ybdeXrbhwV2jWGM+3hip6l6lchLbUa6LXRA0QhUmiPiLAj8kC+a/QlhJwwFMdX55r+
         wgnOzwPu3hMVAU6DJcOtrQBmccDameevX6RNnjjAt3ZCtT2rw+QvLYBNw/NildDef3D+
         qFy2glmLLgPBG3sqfPNwwvFlNxjUcZtF0xDC7aQtHauBrF06reZuwNbSZdvLLwdY0wEE
         8O1g==
X-Forwarded-Encrypted: i=1; AJvYcCUEwCIDoXxDquFkkepGH6dACjtSI3FS7UlV4ZwGuSinySAvRRnTqjIP73a/hEp6Zulxm7s8fNWwdosXlg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4ANlIZrMrlkJVhWMs1rPyOV2gQan3MvcHAreulkOw2+V9bImL
	hDpKSDg1SGoyHltM37in10QF8/mPy06LggBir/CnHeDhtwOFXYIo
X-Gm-Gg: ASbGncudH1mdPYNbeijJ3trukcg+I697Dl9UqsgDj4NAMBlXInAlaMyQMI9p67KWrpZ
	h+6o6AA51fUsXl3w7VqbbjFpBQWYzhD3X6fp45P8x5NRJzJ1URNrlVQrbJhJyJvQ1PrE9lqTQdU
	9KNCLewhc6rUcl6hOK9fbZNR+O2+C0/qrsgHsR3bvsVW0NXHPMJM/EsmYIc4tiSA5MbnU3agkZe
	dN+p4/E5id90npoKRudYaD7Hw8eHAr1kWlQEbi7g2xVwlK4f61wH+2ux3MuSPuqqdFoNxjS3i9H
	6w/t9VtkXPTCuwGW0UJNjo+L0FRSDmY0+AiUVpGSa0MHg03RUgio
X-Google-Smtp-Source: AGHT+IEruA9as/oJ+0B7yZpR+Du0MWt57ncaMUqTh8cPjv7Ydql7nmgBG5oMdHqeXfUBIja3MTJxOg==
X-Received: by 2002:a05:6402:458c:b0:5e0:2d53:b2a with SMTP id 4fb4d7f45d1cf-5e02d530e00mr597835a12.3.1739532187306;
        Fri, 14 Feb 2025 03:23:07 -0800 (PST)
Received: from Junction.dargent.eu (242.76.29.93.rev.sfr.net. [93.29.76.242])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532594a0sm329434266b.68.2025.02.14.03.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 03:23:07 -0800 (PST)
From: Regis Dargent <regis.dargent@gmail.com>
To: 
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2]: watchdog: sunxi: Allow watchdog to remain enabled after probe
Date: Fri, 14 Feb 2025 12:22:53 +0100
Message-Id: <20250214112255.97099-1-regis.dargent@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAGb2v67tmzGfcFPchjzfSima-sT_u7viYd1UDGB9r6ZeJEgdyg@mail.gmail.com>
References: <CAGb2v67tmzGfcFPchjzfSima-sT_u7viYd1UDGB9r6ZeJEgdyg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


I (tried) to fix commit format (still learning, please comment is something
is missing).

I made the suggested code fixes and added a sunxi_wdt_read_timeout function;
it was a bit more touchy, as the HW timeout could be set to less than a second
(really?), so I had to manage max_hw_heartbeat_ms too.

