Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B864D4868
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Oct 2026 17:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791221160; cv=none; b=iZjaFkOkpiwe7SbhbUawgYbIQcLn7uD7t/Fox5EhvSTq77wVubryokAOuhXknYR+Sj+5l1NYGPSfRmcVMfQHNaa5sSu4paPfrbwV+MdcsHwR4XR18NOp4s+Dhl7LBHeoMEn0bev6EQGsT2f9GeIcDfbBjCxU3ctDe3vd6qn5uD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791221160; c=relaxed/simple;
	bh=1TovBGqb+S+doAvi0jZy2UcBL66zBbQNb/CjU/As8cs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SzIGEMNKKI913AXosgZLrdpkRgi7j5bJ06DEZCY3KMUZtjxxnow2JSf5Q1BLvnOG+/vM6/E6W0A5oDlOkgX6sma8vN34tg+Qz6pfinUYhzxqeyrxj3s/d4qWO9G1I1HgYNXc76yLxfxF9VLCaFvNWmOoav8NcKCqxPseDRBO15I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fusdbF4P; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fusdbF4P"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66c9995ca60so82103d50.1
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Oct 2026 10:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791221157; x=1791825957; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B2r0pjGElK1T1XiGX8hF3bDF5aD44JQI3Axp9h+wJZA=;
        b=fusdbF4P3EisrwKYC/YhOXSHpLqXvs05g+yC4l9X6TNCUcoiB2qzIHmrNx81fOj6sd
         jTKXf510E8I1ClxWqNWNGu7ply6cxl4wx/3eWyEzraBPByTsi9OvgGtKZizxG6YvCPbH
         4TlwMdAEwUQ9H9/m2Ceoyw2qWuJFekmV+7M9ZSq0YcrbBIMfejgZ/BZSla1TV+RylX5p
         UEXChlrDMaxHh9av3zRFz0VaYT1emTYt1McS3o+jsfNIXixCXxd8sZwqwsnwHaD7trPz
         PbA9MOkxPFHNX5t7LIbXrsFTG4mEOKitpKdIOfJew94FyQK9yaFPKRNe6jZuSt8TbeGl
         LWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791221157; x=1791825957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B2r0pjGElK1T1XiGX8hF3bDF5aD44JQI3Axp9h+wJZA=;
        b=Sp5ZDdJVA56nvCQnnws+SJIItFRo+e3l9S15vSkgvm3KH1Yzx0AWsT8S4s5F2z/vz8
         IuXANJHM3R7LSUEQSMH5xVjYmYWy+ATKAgSk8Gvh9gakGjKFvsucpK6y93oUKH0Fr/AG
         J39vjuwsmUBXgYJUD50bv14/jqcEhScrRAgUMDoYkYTas183AjKuo8uOwiwzooMdH+oG
         RUHODHkXa3kbd7sm47jWv2Dxxcv8Wpj7Xvn/dBIimdvgttTvbmdePghWotX0lLAurnXh
         B3CWiBFPeCI35E3PKFIb2t1VtYxbIaAx4eKtUUKRS/DD7yF4+5xEnKcOmUoCoW6S9YMy
         L65w==
X-Forwarded-Encrypted: i=1; AKwUvBxxMW86NcwSxK4oRNeBlRDSyWUzCbbipM9BIjBh/ziDYH3p104jY1DflDqO0u7UK6iUYGfnilCtXQ9NnA==@lists.linux.dev
X-Gm-Message-State: AFuF++kqWK9WZJvSRF34uYmsHFJ8XRweLBLPquC9AxTTsCG1+k7EIQwR
	i2+84LySxCL+mk0tl/82RaBgggGqcaXjeV724oZyUC+t+v0pXLlgmO1H
X-Gm-Gg: AYBFou2y7TGj4Y+GVk8MzoZHv2Bz8r4rrXds70ZKd/w+vRxKZ+1XWreLkqbrmtXsU80
	nT/JZ3jsXjBZbaHs1dEHwljydtN7+6KuwZToXubs/QzKKE4LWitO6Q+bzfM1cxvcXc8HeRwU1il
	/+gqJFovmL8GEYQoWHqdQ9eRhJr/zgYll1fyse9+yovFUNPt3dR3+os5jG7U/A75Y1en9ETWL1I
	jnhkVyuXBFYWDErvh7DUu7lm4pYp8gHiMe9TqKxlP95UT4AF7FUQZn+UOGv54Yy1S8rWh86XffP
	3r7WJsQq/sM707cN3MYFZFEhyoQCmyP4W7djOtC52GOFrpoDz/4DFIBBMQJfwfC67+juXqfZaHq
	U+tSW5WOU0zivj7+xM7lyjx+jr8ZboufAx45EJM3IeSwdhEv2dO0SJTmgTMkDyq1rrDBNpjYOGK
	qBPJ7KWlWQ3PpqnBgL/vrn/kU7+Miq8yuubILV4KzQCu0h/KIBMHE87tj9rr+lazUZRrnp7QLQg
	CFu135vInjwznyoxDJg2hUkLkFvNeOYTdOU1DOD6EUGvUp+Jl81X1oKXWYGqWZlNlRiCR5IZL/d
	zpAkOA==
X-Received: by 2002:a05:690e:4142:b0:677:d05a:4800 with SMTP id 956f58d0204a3-677f386139fmr150914d50.25.1791221157435;
        Mon, 05 Oct 2026 10:25:57 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.237.181])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677c1b1b585sm3449969d50.5.2026.10.05.10.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:25:57 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: [PATCH 0/3] serial: 8250_dw: Allwinner A733 UART support
Date: Mon,  5 Oct 2026 14:25:35 -0300
Message-ID: <20261005172538.398522-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I'm bringing up mainline on the Radxa Cubie A7Z (Allwinner A733). The
console worked until the first termios change from userspace, then
stopped taking interrupts.

Patch 1 fixes that in the generic driver: with a DLF register present,
dw8250_setup_port() replaces the BUSY-safe divisor hook, and the LCR
retry path then restores IER into DLH. It's tagged for stable.

Patches 2-3 add an A733 compatible with two quirks: no clk_set_rate()
around termios (the baud clock is a fixed bus gate), and no DLF probe
(offset 0xc0 is an RS485 control register).

Tested on a Cubie A7Z, with local DT and clock changes that aren't part
of this series. The console worked in both directions and a termios
stress loop ran without stalls or corrupted bytes. The no-DLF check in
patch 3 was reworked after that run (an if block in place of a goto),
and this exact revision hasn't been booted yet.

The A733 DTSI isn't in linux-next yet. Enzo Adriano's posted version
uses plain "snps,dw-apb-uart" for uart0, so it would need the new
compatible once this lands.

Based on tty-next.

Vinicius Pedrosa (3):
  serial: 8250_dw: Keep the BUSY-safe divisor hook when DLF is present
  dt-bindings: serial: snps-dw-apb-uart: Add Allwinner A733
  serial: 8250_dw: Add Allwinner A733 UART

 .../bindings/serial/snps-dw-apb-uart.yaml     |  1 +
 drivers/tty/serial/8250/8250_dw.c             | 25 ++++++++++++++++++-
 drivers/tty/serial/8250/8250_dwlib.c          | 22 ++++++++--------
 drivers/tty/serial/8250/8250_dwlib.h          |  1 +
 4 files changed, 38 insertions(+), 11 deletions(-)


base-commit: 36844ea19656fb41278799ef3d5cd52120d89149
-- 
2.43.0
