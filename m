Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AFC3D88F5
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Sep 2026 20:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790021149; cv=none; b=dQadJFycSrDjs4Z/y2zaImK/EWMOUlRgh6NZbnzBHfeJ8HC3y5bgwUuH36u3g8AIYtGrcVlVc81CUzgzBd9e0cWyPucMQaO/Aybgnc7+TvWF78gYB16b3n3PPh4p0q3OyiOu8pdVVyY2D+RJzkmrXABcA7G+cZ2YdnnQ/dPSoGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790021149; c=relaxed/simple;
	bh=nzIyM1UUgfHrCnNkdExSZlN4EV6u2ygukEYsksghxwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=amBM81pEWw8dbataSFtbPJ2H58GzplO3/xXWlOH03sQr7RAwIb58iJ/5+6tLH04+pbvBawbjcvJJ7fph+sbgNXAVnh4FEw5OArxpcDwNY83vN0nBxIsvw6xWkwXcpoGExWJPG/NFi39vle9ujCUNzKtbTdnd729l85H/ghw9plA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WvoAHcTF; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WvoAHcTF"
Received: by mail-oi2-f12.google.com with SMTP id 46e09a7af769-7f4f0c89e33so1880161a34.0
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Sep 2026 13:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790021147; x=1790625947; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nzIyM1UUgfHrCnNkdExSZlN4EV6u2ygukEYsksghxwQ=;
        b=WvoAHcTFC6bn21qfsq9E6b2F3TsbxrIBfJ9Fx6x4ayYNMPoTUYIcLr9NwKO3abzWmO
         Xp0odj8OfFpsWMemMDQc3RxmTnDaFdKKwakkP5dp03ADNJbMVDl/FozMOtVLr9bgbU1O
         YAizYvI3KKThznZdxgoTAvIQf8NSnR3dmVbjF+fBLhMYQ1Q4t77WeF5AlXRA9/Cmup3m
         tha/7xhgldDbvddYlbsJ7zyOQEQBYzG6R2jBzUqsbwSxlr66r1muURTjw50P8mFA/7uU
         NnjdOYUEn76WYG2X2bmNWe8ZfHQ8YMW0LvXV+fZyA7rygagFYHfWRPphh8g49Dq6TlqS
         zX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790021147; x=1790625947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nzIyM1UUgfHrCnNkdExSZlN4EV6u2ygukEYsksghxwQ=;
        b=UD6aU+9RePrRP0olI8hBCq0eXxf+ikWkp4llxDcCUwXoSqrl1G8Oi4oH/OsRuLo3xF
         IBrQo3g01H4UbH7z7bP2Gc0SbcQvTKMCBJZD2svY/W3kRBx5+t03S6AgUh4Ksg/ME3Zy
         eROOrodzp7J1jNCaDgxeziI+e6B+8Q/GN/QWK8PAzJeKt40oGFUHoG91SnOzE55c4XwE
         /Hhy9YETESlbfWAp7423YyJHgb480QPsJ1PnIAlaUUDT3eK7mH+0UkO+6T4Ad2ActJQD
         e1LTfnLWfGuyh7whkjkFhAi8bBThW1Wj28K3snX2yu2Mo0jUy25umOPyCbaozp5vIqz5
         nijA==
X-Gm-Message-State: AFuF++lnOmDF3AagnXU2Rwb3Pvp9Z/MVsC5L1fU2cptLtCayuH9b2glx
	su9slaWPBZ2l6cK93SAGh38rFWRXBSA4itXxJJj0ESDq/OcofNYNy/ZJdMruaA==
X-Gm-Gg: AYBFou3GHxZJPY2EqOrui20gx/jRJhIE8PSQJ9n8cM/twA2/yIsXqGVMH/ND2kU688F
	x+IXSfU86sfGcBfQr+z30IItkLb2UxmFQF9CjcYEPO5j6FD1Wt4DVTo9gFUHrvtXZ3mwNXLaLS5
	hxSYMYaDs42wSYqjJS2fghLQVjOSYaQ0rX8YibY6xWELuFt2wOMehxIU9ytyHQVZ0Lop3WY8Pxr
	u4SlWuuhMLBgTHNR1zDmOSkJAd56/57gdtwM2B4SOv03voaDvSVlsmWUyNJme/oHSFCrLt4+fhh
	QKbky6HmZ73suRyr+QJmgcWBvym9m1/WEgIKx/M4LyGojU1oFADTrUV1QbplBAlNukVMMZ2hST8
	2NrPUHrdjiNRON/4RRfpNe5K9+TJQHM1NU5yv4BRHwKthvpHeLpKzvcnMNjTprt/SZIYYF4jSDv
	QQOSZ1DQbQcWgLz2XLPrAqOl5owJGMwUO196hY4y04fd8G2Qv2Zki7OPBvshpQG/o1qpX5XJ9BA
	2M/S+6Ne+A6Zq7IcRhMX4wmK46uyW9ywlJyaeUPwsU+IQ==
X-Received: by 2002:a05:6830:2e05:b0:7f4:bae7:b00d with SMTP id 46e09a7af769-80ddd399b18mr15327748a34.0.1790021146852;
        Mon, 21 Sep 2026 13:05:46 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-814768b3d57sm1073622a34.17.2026.09.21.13.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 13:05:46 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com
Cc: linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] pinctrl: sunxi: fix EINT bank indexing for SoCs with empty leading banks
Date: Mon, 21 Sep 2026 16:05:45 -0400
Message-ID: <20260921200545.3179974-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260724005030.229fc6e2@ryzen.lan>
References: <20260704030821.561389-1-enzo.adriano.code@gmail.com> <20260724005030.229fc6e2@ryzen.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andre,

Thank you for the review and for pointing out both the cross-SoC binding
issue and the correct way to report findings against an unmerged series.
Please consider this standalone patch withdrawn.

I agree that the EINT bank representation must be consistent across A523
and A733. The evidence I have does not justify changing the generic driver
to compact empty banks. I will keep any future findings on the active
series or its cover letter instead of sending a follow-up patch against an
unmerged series.

Sorry for the delayed closure.

Assisted-by: Codex:gpt-5
I reviewed this reply and take responsibility for its contents.

Regards,
Enzo
